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
#  user_id         :bigint           not null
#
# Indexes
#
#  index_payments_on_product_item_id  (product_item_id)
#  index_payments_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_item_id => product_items.id)
#  fk_rails_...  (user_id => users.id)
#
class Payment < ApplicationRecord
  belongs_to :product_item
  belongs_to :user
  validates :amount, numericality: { greater_than: 0 }, allow_nil: true
  # validates :date
end
