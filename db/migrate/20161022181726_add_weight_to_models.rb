class AddWeightToModels < ActiveRecord::Migration[5.0]
  def change
    add_column :models, :weight, :string
  end
end
