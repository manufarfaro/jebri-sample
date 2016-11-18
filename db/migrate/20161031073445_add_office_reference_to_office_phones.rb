class AddOfficeReferenceToOfficePhones < ActiveRecord::Migration[5.0]
  def change
    add_reference :offices_phones, :offices
  end
end
