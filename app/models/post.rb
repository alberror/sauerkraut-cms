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
#
class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :thumbnail
  has_rich_text :body

  include FriendlyId
  friendly_id :slug

  validates :title, :slug, :summary, :body, presence: true
end
