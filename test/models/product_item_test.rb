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
require "test_helper"

class ProductItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
