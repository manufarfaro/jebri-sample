class Commerce < ApplicationRecord
  acts_as_paranoid

  has_many :offices, dependent: :destroy

  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: lambda { |a| "#{a.instance.create_default_avatar_missing_path}" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  validates :name, presence: true

  after_initialize :set_default_enabled, :if => :new_record?

  def set_default_enabled
    self.enabled ||= true
  end

  scope :enabled, -> {
    where(enabled: true)
  }

  filterrific(
      default_filter_params: { sorted_by: 'created_at_desc' },
      available_filters: [
          :sorted_by,
          :search_query,
          :with_enabled
      ]
  )

  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
      when /^created_at_/
        # Simple sort on the created_at column.
        # Make sure to include the table name to avoid ambiguous column names.
        # Joining on other tables is quite common in Filterrific, and almost
        # every ActiveRecord table has a 'created_at' column.
        order("commerces.created_at #{ direction }")
      when /^name_/
        # Simple sort on the name colums
        order("LOWER(commerces.name) #{ direction }")
      when /^enabled_/
        # Simple sort on the name colums
        order("LOWER(commerces.enabled) #{direction}")
      else
        raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
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
    num_or_conds = 1
    where(
        terms.map { |term|
          '(LOWER(commerces.name) LIKE ?)'
        }.join(' AND '),
        *terms.map { |e| [e] * num_or_conds }.flatten
    )
  }
  scope :with_enabled, lambda { |enabled|
    where(enabled: enabled)
  }

  def self.options_for_sorted_by
    [
        ['Creación (Nuevos Primero)', 'created_at_desc'],
        ['Creación (Antiguos Primero)', 'created_at_asc'],
        ['Nombre (a-z)', 'name_asc'],
        ['Nombre (z-a)', 'name_desc'],
        ['Habilitado (Si-No)', 'enabled_asc'],
        ['Habilitado (No-Si)', 'enabled_desc']
    ]
  end
  def create_default_avatar_missing_path
    ActionController::Base.helpers.image_path('missing.png')
  end
end
