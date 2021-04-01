# == Schema Information
#
# Table name: items
#
#  id         :bigint           not null, primary key
#  name       :string
#  slug       :string
#  stock      :integer
#  summary    :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :string           default("unconfirmed")
#
require "test_helper"

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
