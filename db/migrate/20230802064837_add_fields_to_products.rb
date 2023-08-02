class AddFieldsToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :description, :text
    add_column :products, :unit_price, :decimal, precision: 10, scale: 2, null: false
  end
end
