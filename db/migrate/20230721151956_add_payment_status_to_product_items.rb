class AddPaymentStatusToProductItems < ActiveRecord::Migration[7.0]
  def change
    add_column :product_items, :payment_status, :integer, null: false
  end
end
