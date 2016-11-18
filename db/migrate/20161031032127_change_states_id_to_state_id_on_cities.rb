class ChangeStatesIdToStateIdOnCities < ActiveRecord::Migration[5.0]
  def change
    rename_column :cities, :states_id, :state_id
  end
end
