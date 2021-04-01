# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :string           default("pending")
#
class Order < ApplicationRecord
  STATUSES = ["pending", "paid", "sent"]

  belongs_to :user
  has_many :purchases
  has_many :items, through: :purchases

  validates :status, inclusion: { in: STATUSES }
end
