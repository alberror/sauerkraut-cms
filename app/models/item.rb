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
class Item < ApplicationRecord
  STATUSES = ["unconfirmed", "published", "unpublished"]

  has_one_attached :thumbnail
  has_rich_text :body

  has_many :purchases
  has_many :orders, through: :purchases

  validates :name, :summary, :body, presence: true
  validates :stock, presence: true, numericality: true
  validates :status, presence: true, inclusion: { in: STATUSES }
end
