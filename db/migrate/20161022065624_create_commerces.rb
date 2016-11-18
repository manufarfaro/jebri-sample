class CreateCommerces < ActiveRecord::Migration[5.0]
  def change
    create_table :commerces do |t|
      t.string :name
      t.string :url
      t.boolean :enabled
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :commerces, :deleted_at
  end
end
