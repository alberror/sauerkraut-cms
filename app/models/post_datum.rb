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
class PostDatum < ApplicationRecord
  belongs_to :post
end
