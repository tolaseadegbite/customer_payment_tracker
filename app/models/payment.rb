# == Schema Information
#
# Table name: payments
#
#  id              :bigint           not null, primary key
#  amount          :decimal(10, 2)
#  date            :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  product_item_id :bigint           not null
#
# Indexes
#
#  index_payments_on_product_item_id  (product_item_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_item_id => product_items.id)
#
class Payment < ApplicationRecord
  belongs_to :product_item
  validates :amount, numericality: { greater_than: 0 }, allow_nil: true
  # validates :date
end
