class RemoveNameFromProductItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :product_items, :name, :string
  end
end
