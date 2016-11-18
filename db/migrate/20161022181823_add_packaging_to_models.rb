class AddPackagingToModels < ActiveRecord::Migration[5.0]
  def change
    add_column :models, :packaging, :string
  end
end
