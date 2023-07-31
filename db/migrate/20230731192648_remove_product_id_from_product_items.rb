class RemoveProductIdFromProductItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :product_items, :product_id, :integer
  end
end
