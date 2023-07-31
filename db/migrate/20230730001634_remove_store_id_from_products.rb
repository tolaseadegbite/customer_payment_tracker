class RemoveStoreIdFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :store_id, :integer
  end
end
