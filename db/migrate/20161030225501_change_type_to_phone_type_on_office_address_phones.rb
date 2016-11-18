class ChangeTypeToPhoneTypeOnOfficeAddressPhones < ActiveRecord::Migration[5.0]
  def change
    rename_column :office_address_phones, :type, :phone_type
  end
end
