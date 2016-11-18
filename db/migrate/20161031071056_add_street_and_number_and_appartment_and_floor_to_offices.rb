class AddStreetAndNumberAndAppartmentAndFloorToOffices < ActiveRecord::Migration[5.0]
  def change
    add_column :offices, :street, :string
    add_column :offices, :number, :string
    add_column :offices, :appartment, :string
    add_column :offices, :floor, :string
  end
end
