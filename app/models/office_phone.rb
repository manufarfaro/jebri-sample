class OfficePhone < ApplicationRecord
  acts_as_paranoid

  belongs_to :office

  validates :office_id, presence: true
  validates :number, presence: true

  after_initialize :set_default_values, :if => :new_record?

  def set_default_values
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
        order("office_phones.created_at #{ direction }")
      when /^number_/
        # Simple sort on the name colums
        order("LOWER(office_phones.number) #{ direction }")
      when /^enabled_/
        # Simple sort on the name colums
        order("LOWER(office_phones.enabled) #{direction}")
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
          '(LOWER(office_phones.number) LIKE ?)'
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
        ['Número (Ascendiente)', 'number_asc'],
        ['Número (Descendiente)', 'number_desc'],
        ['Habilitado (Si-No)', 'enabled_asc'],
        ['Habilitado (No-Si)', 'enabled_desc']
    ]
  end
end
