class Office < ApplicationRecord
  acts_as_paranoid

  belongs_to :commerce
  has_one :city
  has_many :office_phones, dependent: :destroy

  enum office_type: [:particular, :general]

  validates :street, presence: true
  validates :number, presence: true
  validates :office_type, presence: true
  validates :city_id, presence: true

  after_initialize :set_default_values, :if => :new_record?
  before_destroy :on_destroy

  def set_default_values
    self.enabled ||= true
    self.office_type ||= :particular
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
        order("offices.created_at #{ direction }")
      when /^name_/
        # Simple sort on the name colums
        order("LOWER(offices.fantasy_name) #{ direction }")
      when /^enabled_/
        # Simple sort on the name colums
        order("LOWER(offices.enabled) #{direction}")
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
    terms = query.downcase.split(/\s+/)

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
          '(LOWER(offices.fantasy_name) LIKE ?)'
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

  def  self.options_for_office_type
    [
      ['Particular', 0],
      ['General', 1]
    ]
  end
  def self.options_for_cities
    @cities_collection = []
      State.all.each do |state|
        @cities_collection.push ([
            "#{state.name} - #{ISO3166::Country.new(state.country_alpha2)}",
                state.cities.pluck(:name, :id)
        ])
      end
    @cities_collection
  end
  def on_destroy
    OfficePhone.where(office: self).each do |phone|
      phone.destroy!
    end
  end
end
