# == Schema Information
#
# Table name: post_data
#
#  id         :bigint           not null, primary key
#  datum_type :string
#  post_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class PostDatumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
