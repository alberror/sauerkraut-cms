# == Schema Information
#
# Table name: members
#
#  id         :bigint           not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  active     :boolean
#
class Member < ApplicationRecord
  STATUSES = ["active", "inactive"]

  has_one_attached :picture

  validates :first_name, :last_name, presence: true
  validates :status, presence: true, inclusion: { in: STATUSES }

  scope :active, -> {where(status: "active")}

  def full_name
    "#{first_name} #{last_name}"
  end

  def active?
    self.status == "active"
  end
end
