class AddIndexToProducts < ActiveRecord::Migration[7.0]
  def change
    add_index :products, [:name, :store_id], unique: true
  end
end
