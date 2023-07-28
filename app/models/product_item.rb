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
#  user_id              :bigint           not null
#
# Indexes
#
#  index_product_items_on_product_item_date_id  (product_item_date_id)
#  index_product_items_on_user_id               (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_item_date_id => product_item_dates.id)
#  fk_rails_...  (user_id => users.id)
#
class ProductItem < ApplicationRecord
  belongs_to :product_item_date
  belongs_to :user

  has_many :payments, dependent: :destroy
  accepts_nested_attributes_for :payments, reject_if: :all_blank, allow_destroy: true

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

  def has_paid
    return total_price if payment_status == 'paid'
    payments.sum(&:amount)
  end
  
  def total_price
    quantity * unit_price
  end
  
  def unpaid_price
    where(payment_status: 'unpaid').total_price
  end

  def outstanding_price
    return 0 if payment_status == 'paid'
    total_price - has_paid
  end
  
  def percentage_paid
    if payment_status == 'paying'
      percentage = (has_paid/total_price) * 100 
      return percentage.round
    elsif payment_status == 'paid'
      100
    else
      0
    end
  end
end
