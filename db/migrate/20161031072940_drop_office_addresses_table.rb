class DropOfficeAddressesTable < ActiveRecord::Migration[5.0]
  def change
    remove_reference :office_address_phones, :office_addresses, index: true
    drop_table :office_addresses
  end
end
