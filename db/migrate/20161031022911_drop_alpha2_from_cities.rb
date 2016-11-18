class DropAlpha2FromCities < ActiveRecord::Migration[5.0]
  def change
    remove_column :cities, :alpha2
  end
end
