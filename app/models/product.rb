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
<<<<<<< HEAD
#  index_products_on_user_id  (user_id)
=======
#  index_products_on_name_and_store_id  (name,store_id) UNIQUE
#  index_products_on_store_id           (store_id)
#  index_products_on_user_id            (user_id)
>>>>>>> c4b797f8e412fc01ec60384b61439adf3303a238
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Product < ApplicationRecord

    before_create :product_code

<<<<<<< HEAD
    validates_presence_of :name
    # validates :store_id, length: { minimum: 1, allow_nil: true }
=======
    validates_presence_of :name, uniqueness: {  scope: :store_id, message: "Product name has to be unique" }
    validates :store_id, length: { minimum: 1, allow_nil: true }
>>>>>>> c4b797f8e412fc01ec60384b61439adf3303a238
    validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :unit_price, presence: true, numericality: { greater_than: 0 }

    belongs_to :user

    # belongs_to :store, optional: true

    has_many :store_products, dependent: :destroy
    has_many :stores, through: :store_products

    has_many :product_items

    # scope :ordered, -> { where('name LIKE ?', "a%").order(:name) }
    scope :ordered, -> { order(id: :desc) }

    def Product.new_token
        SecureRandom.urlsafe_base64(4)
    end
    
    def product_code
        self.code = Product.new_token
    end

    # def update_code
    #     self.update_attribute(:code, Product.new_token)
    # end
end
