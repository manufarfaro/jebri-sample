class CreateOfficeAddressPhones < ActiveRecord::Migration[5.0]
  def change
    create_table :office_address_phones do |t|
      t.references :office_addresses
      t.string :type
      t.string :number
      t.string :notes
      t.boolean :enabled
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :office_address_phones, :deleted_at
  end
end
