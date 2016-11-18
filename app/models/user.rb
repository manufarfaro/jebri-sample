class User < ApplicationRecord
  # include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable and :omniauthable

  acts_as_paranoid

  enum role: [:client, :admin]

  scope :last_month, -> { where(created_at: Time.now.last_month..Time.now ) }

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :client
  end

  def self.reader_scope
    where(is_admin: true)
  end

  filterrific(
      default_filter_params: { sorted_by: 'created_at_desc' },
      available_filters: [
          :sorted_by,
          :search_query,
          :with_role
      ]
  )

  scope :with_role, lambda { |role|
    where(role: role)
  }

  scope :search_query, lambda { |query|
    # Searches the users table on the 'email', 'first_name' and 'last_name' columns.
    # Matches using LIKE, automatically appends '%' to each term.
    # LIKE is case INsensitive with MySQL, however it is case
    # sensitive with PostGreSQL. To make it work in both worlds,
    # we downcase everything.
    return nil  if query.blank?

    # condition query, parse into individual keywords
    terms = query.to_s.downcase.split(/\s+/)

    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    # configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    num_or_conds = 3
    where(
        terms.map { |term|
          '(LOWER(users.name) LIKE ? OR LOWER(users.surname) LIKE ? OR LOWER(users.email) LIKE ?)'
        }.join(' AND '),
        *terms.map { |e| [e] * num_or_conds }.flatten
    )
  }
  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
      when /^created_at_/
        # Simple sort on the created_at column.
        # Make sure to include the table name to avoid ambiguous column names.
        # Joining on other tables is quite common in Filterrific, and almost
        # every ActiveRecord table has a 'created_at' column.
        order("users.created_at #{ direction }")
      when /^name_/
        # Simple sort on the name colums
        order("LOWER(users.surname) #{ direction }, LOWER(users.name) #{ direction }")
      when /^email_/
        # Simple sort on the name colums
        order("LOWER(users.email) #{direction}")
#      when /^country_name_/
#        # This sorts by a student's country name, so we need to include
#        # the country. We can't use JOIN since not all students might have
#        # a country.
#        order("LOWER(countries.name) #{ direction }").includes(:country)
      else
        raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }

  def self.options_for_sorted_by
    [
      ['Creación (Nuevos Primero)', 'created_at_desc'],
      ['Creación (Antiguos Primero)', 'created_at_asc'],
      ['Nombre (a-z)', 'name_asc'],
      ['Nombre (z-a)', 'name_desc'],
      ['Email (a-z)', 'email_asc'],
      ['Email (z-a)', 'email_desc']
    ]
  end

  def self.options_for_role
    User.roles
  end

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
end
