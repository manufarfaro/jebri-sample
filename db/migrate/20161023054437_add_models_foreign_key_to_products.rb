class AddModelsForeignKeyToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :product_models, foreign_key: true, dependent: :delete
  end
end
