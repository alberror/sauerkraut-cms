# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  user_id    :integer
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  summary    :string
#  slug       :string
#  status     :string           default("unconfirmed")
#
class Post < ApplicationRecord
  STATUSES = ["unconfirmed", "published", "unpublished"]
  belongs_to :user
  has_many :post_data, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :thumbnail
  has_rich_text :body

  include FriendlyId
  friendly_id :slug

  validates :title, :slug, :summary, :body, presence: true
  validates :status, presence: true, inclusion: { in: STATUSES }

  scope :published, -> { where(status: "published") }
end
