class AddFuelCapacityHousingThicknessToModels < ActiveRecord::Migration[5.0]
  def change
    add_column :models, :fuel_capacity, :string
    add_column :models, :housing_thickness, :string
  end
end
