class ChangeAlpha2ToIso31662OnStates < ActiveRecord::Migration[5.0]
  def change
    rename_column :states, :alpha2, :ISO3166_2
  end
end
