class CreateModels < ActiveRecord::Migration[5.0]
  def change
    create_table :models do |t|
      t.references :product, foreign_key: true
      t.string :name
      t.string :power
      t.string :max_useful_power
      t.boolean :security_brake
      t.string :engine_type
      t.string :chassis
      t.string :case_width
      t.string :cutting_height
      t.string :wheels
      t.string :collector_capacity
      t.string :cutting_surface
      t.boolean :enabled
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :models, :deleted_at
  end
end
