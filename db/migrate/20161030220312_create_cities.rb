class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.references :states, foreign_key: true
      t.string :alpha2
      t.string :name
      t.boolean :enabled
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :cities, :deleted_at
  end
end
