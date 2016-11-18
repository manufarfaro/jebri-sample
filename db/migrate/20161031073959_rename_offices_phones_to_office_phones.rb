class RenameOfficesPhonesToOfficePhones < ActiveRecord::Migration[5.0]
  def change
    rename_table :offices_phones, :office_phones
  end
end
