# == Schema Information
#
# Table name: purchases
#
#  id         :bigint           not null, primary key
#  stock      :integer
#  item_id    :bigint           not null
#  order_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class PurchaseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
