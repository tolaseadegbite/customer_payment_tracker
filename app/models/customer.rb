# == Schema Information
#
# Table name: customers
#
#  id           :bigint           not null, primary key
#  name         :string
#  phone_number :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_customers_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Customer < ApplicationRecord
  validates_presence_of :name, :phone_number

  belongs_to :user
  
  has_many :product_item_dates, dependent: :destroy  
  
  has_many :product_items, through: :product_item_dates


  scope :ordered, -> { order(created_at: :desc) }


  def total_price
    product_items.sum(&:total_price)
  end

  def unpaid_price
    # product_items.where(payment_status: 'unpaid').sum(&:total_price)
    product_items.sum(&:outstanding_price)
  end
end
