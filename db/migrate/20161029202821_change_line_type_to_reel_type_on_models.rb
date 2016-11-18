class ChangeLineTypeToReelTypeOnModels < ActiveRecord::Migration[5.0]
  def change
    rename_column :models, :line_type, :reel_type
  end
end
