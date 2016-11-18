class RenameOfficeAddessPhonesToOfficePhones < ActiveRecord::Migration[5.0]
  def change
    rename_table :office_address_phones, :offices_phones
  end
end
