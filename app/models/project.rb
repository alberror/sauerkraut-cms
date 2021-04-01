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
#
class Project < ApplicationRecord
  STATUSES = ["unconfirmed", "published", "unpublished"]

  has_one_attached :thumbnail

  validates :client, presence: true
  validates :status, presence: true, inclusion: { in: STATUSES }
end
