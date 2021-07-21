# == Schema Information
#
# Table name: comment_data
#
#  id         :bigint           not null, primary key
#  datum_type :string
#  comment_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class CommentDatumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
