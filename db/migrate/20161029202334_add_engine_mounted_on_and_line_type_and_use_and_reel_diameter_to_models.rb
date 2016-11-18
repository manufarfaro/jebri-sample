class AddEngineMountedOnAndLineTypeAndUseAndReelDiameterToModels < ActiveRecord::Migration[5.0]
  def change
    add_column :models, :engine_mounted_on, :string
    add_column :models, :line_type, :string
    add_column :models, :use, :string
    add_column :models, :reel_diameter, :string
  end
end
