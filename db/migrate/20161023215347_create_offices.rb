class CreateOffices < ActiveRecord::Migration[5.0]
  def change
    create_table :offices do |t|
      t.references :commerce, foreign_key: true
      t.string :fantasy_name
      t.integer :type, default: 0
      t.boolean :is_sales, default: false
      t.boolean :is_technical_support, default: false
      t.string :notes
      t.string :url
      t.boolean :enabled, default: true

      t.timestamps
      t.datetime :deleted_at
    end
    add_index :offices, :deleted_at
  end
end
