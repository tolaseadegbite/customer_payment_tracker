# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  code        :string
#  description :text
#  name        :string           not null
#  quantity    :integer          not null
#  unit_price  :decimal(10, 2)   not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_products_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Product < ApplicationRecord
    validates_presence_of :name
    validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :unit_price, presence: true, numericality: { greater_than: 0 }

    belongs_to :user

    has_many :store_products
    has_many :stores, through: :store_products

    has_many :product_items

    scope :ordered, -> { where('name LIKE ?', "a%").order(:name) }

end
