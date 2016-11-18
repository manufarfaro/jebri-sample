class State < ApplicationRecord
  acts_as_paranoid

  has_many :cities, dependent: :destroy

  validates :name, presence: true
  validates :country_alpha2, presence: true

  after_initialize :set_default_values, :if => :new_record?
  before_destroy :on_destroy

  def set_default_values
    self.enabled ||= true
    self.country_alpha2 = 'AR'
  end

  filterrific(
      default_filter_params: { sorted_by: 'created_at_desc' },
      available_filters: [
          :sorted_by,
          :search_query,
          :with_enabled
      ]
  )

  scope :enabled, -> {
    where(enabled: true)
  }

  scope :with_enabled, lambda { |enabled|
    where(enabled: enabled)
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
          '(LOWER(states.name) LIKE ?)'
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
        order("states.created_at #{ direction }")
      when /^name_/
        # Simple sort on the name colums
        order("LOWER(states.name) #{ direction }")
      when /^enabled_/
        # Simple sort on the name colums
        order("LOWER(states.enabled) #{direction}")
      else
        raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }
  def self.options_for_country
    countries_available = [:AR, :UY]
    countries_collection = Array.new

      countries_available.each do |country_code|
        @country = ISO3166::Country.new(country_code)
        countries_collection.push([ @country.name, @country.data['alpha2'] ])
      end

    countries_collection
  end
  def on_destroy
    City.where(state: self).each do |city|
      city.destroy!
    end
  end
  scope :with_offices, proc  { |type|
    joins(cities: [:offices])
      .group('states.id, cities.id')
      .having('count(offices.id) > 0')
      .distinct
  }
end
