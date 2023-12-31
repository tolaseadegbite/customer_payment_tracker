class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.decimal :amount, precision: 10, scale: 2, null: true
      t.references :product_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
