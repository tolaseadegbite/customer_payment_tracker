class AddStoreIdToProductItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :product_items, :store, null: false, foreign_key: true, default: 1
  end
end
