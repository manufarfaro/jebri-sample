class DropProductModelsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :product_models, force: :cascade
  end
end
