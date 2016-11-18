class AddCityToOffices < ActiveRecord::Migration[5.0]
  def change
    add_reference :offices, :city, foreign_key: true
  end
end
