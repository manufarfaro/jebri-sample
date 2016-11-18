class CreateProductFamilies < ActiveRecord::Migration[5.0]
  def change
    create_table :product_families do |t|
      t.string :name
      t.boolean :enabled

      t.timestamps
      t.datetime :deleted_at
      t.index :deleted_at
    end
  end
end
