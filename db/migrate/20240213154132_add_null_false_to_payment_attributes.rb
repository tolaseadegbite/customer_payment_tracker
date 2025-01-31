class AddNullFalseToPaymentAttributes < ActiveRecord::Migration[7.0]
  def change
    change_column_null :payments, :amount, false
    change_column_null :payments, :date, false
  end
end
