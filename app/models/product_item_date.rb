# == Schema Information
#
# Table name: product_item_dates
#
#  id          :bigint           not null, primary key
#  date        :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :bigint           not null
#
# Indexes
#
#  index_product_item_dates_on_customer_id           (customer_id)
#  index_product_item_dates_on_date                  (date)
#  index_product_item_dates_on_date_and_customer_id  (date,customer_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#
class ProductItemDate < ApplicationRecord
  belongs_to :customer
  
  validates_presence_of :date, uniqueness: { scope: :customer_id, message: "Date has been created" }
  
  scope :ordered, -> { order(date: :asc) }

  has_many :product_items, dependent: :destroy

  def previous_date
    customer.product_item_dates.ordered.where("date < ?", date).last
  end
end
