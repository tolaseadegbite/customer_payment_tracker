class AddNameToProductItems < ActiveRecord::Migration[7.0]
  def change
    add_column :product_items, :name, :string
  end
end
