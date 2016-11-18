class ChangeOfficesIdToOfficeIdOnOfficePhones < ActiveRecord::Migration[5.0]
  def change
    rename_column :office_phones, :offices_id, :office_id
  end
end
