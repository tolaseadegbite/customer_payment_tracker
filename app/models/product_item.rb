# == Schema Information
#
# Table name: product_items
#
#  id                   :bigint           not null, primary key
#  description          :text
#  name                 :string           not null
#  payment_status       :integer          not null
#  quantity             :integer          not null
#  unit_price           :decimal(10, 2)   not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  product_item_date_id :bigint           not null
#
# Indexes
#
#  index_product_items_on_product_item_date_id  (product_item_date_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_item_date_id => product_item_dates.id)
#
class ProductItem < ApplicationRecord
  belongs_to :product_item_date

  enum :payment_status, {
    unpaid: 0,
    paying: 1,
    paid: 2
  }

  validates :name, presence: true
  validates :payment_status, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :unit_price, presence: true, numericality: { greater_than: 0 }

  delegate :customer, to: :product_item_date

  def total_price
    quantity * unit_price
  end

  def unpaid_price
    where(payment_status: 'unpaid').total_price
  end
end
