class CreateStates < ActiveRecord::Migration[5.0]
  def change
    create_table :states do |t|
      t.string :country_alpha2
      t.string :alpha2
      t.string :name
      t.boolean :enabled
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :states, :deleted_at
  end
end
