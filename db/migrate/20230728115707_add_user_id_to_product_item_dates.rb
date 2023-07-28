class AddUserIdToProductItemDates < ActiveRecord::Migration[7.0]
  def change
    add_reference :product_item_dates, :user, null: false, foreign_key: true
  end
end
