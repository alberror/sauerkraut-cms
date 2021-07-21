# == Schema Information
#
# Table name: projects
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  client     :string
#  partner    :string
#  summary    :string
#  status     :string           default("unconfirmed")
#  title      :string
#  slug       :string
#
require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
