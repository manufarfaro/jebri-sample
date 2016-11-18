class ChangeTypeToOfficeTypeOnOffices < ActiveRecord::Migration[5.0]
  def change
    rename_column :offices, :type, :office_type
  end
end
