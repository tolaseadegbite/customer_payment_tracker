class AddDateToPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :date, :date
  end
end
