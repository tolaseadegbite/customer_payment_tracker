class RemovePriceAndDescFromProductItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :product_items, :unit_price, :decimal
    remove_column :product_items, :description, :text
  end
end
