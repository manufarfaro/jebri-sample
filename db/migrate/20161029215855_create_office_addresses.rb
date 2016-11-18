class CreateOfficeAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :office_addresses do |t|
      t.references :offices
      t.string :street
      t.integer :number
      t.string :floor
      t.string :appartment
      t.string :notes
      t.boolean :enabled
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :office_addresses, :deleted_at
  end
end
