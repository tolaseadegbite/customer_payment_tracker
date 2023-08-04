class AddStoreIdToProducts < ActiveRecord::Migration[7.0]
  def change
    # add_reference :products, :store, null: false, foreign_key: true, default: 1
    add_reference :products, :store, foreign_key: true
  end
end
