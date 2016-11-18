class AddTubeAndCuttingWidthAndIncludesAndColorToModels < ActiveRecord::Migration[5.0]
  def change
    add_column :models, :tube, :string
    add_column :models, :cutting_width, :string
    add_column :models, :includes, :string
    add_column :models, :color, :string
  end
end
