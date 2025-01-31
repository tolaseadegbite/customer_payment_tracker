# == Schema Information
#
# Table name: stores
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_stores_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Store < ApplicationRecord
  belongs_to :user

  validates_presence_of :name

  has_many :products

  has_many :store_products
  has_many :products, through: :store_products
  
  has_many :product_items

  scope :ordered, -> { order(created_at: :desc) }

  def all_store_products
    products
  end
end
