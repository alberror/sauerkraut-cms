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
class Project < ApplicationRecord
  STATUSES = ["unconfirmed", "published", "unpublished"]

  has_one_attached :thumbnail
  has_many_attached :screenshots

  validates :title, :client, :slug, :summary, presence: true
  validates :status, presence: true, inclusion: { in: STATUSES }

  scope :published, -> { where(status: "published") }
end
