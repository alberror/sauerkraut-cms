# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  post_id    :bigint           not null
#  author     :string
#  status     :string           default("unconfirmed")
#  email      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord
  STATUSES = ["unconfirmed", "published", "unpublished"]
  belongs_to :post
  has_many :comment_data, dependent: :destroy

  validates :post, :author, :email, :status, :body, presence: true

  scope :published, -> { where(status: "published") }
end
