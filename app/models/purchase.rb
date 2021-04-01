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
class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :order
end
