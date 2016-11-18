class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.references :product_family, foreign_key: true
      t.string :name
      t.string :description
      t.boolean :enabled

      t.timestamps
    end
  end
end
