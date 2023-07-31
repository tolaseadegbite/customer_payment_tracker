# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  code       :string
#  name       :string           not null
#  quantity   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
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
    # validates_presence_of :unit_price, numericality: { greater_than: 0 }
    validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

    belongs_to :user

    has_many :store_products
    has_many :stores, through: :store_products

    has_many :product_items

    scope :ordered, -> { where('name LIKE ?', "a%").order(:name) }

end
