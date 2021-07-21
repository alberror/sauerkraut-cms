# == Schema Information
#
# Table name: members
#
#  id         :bigint           not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  active     :boolean
#
require "test_helper"

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
