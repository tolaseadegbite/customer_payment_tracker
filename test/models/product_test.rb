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
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
