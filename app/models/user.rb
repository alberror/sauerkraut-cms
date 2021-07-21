# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  role                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  phone                  :string
#  status                 :string           default("active")
#  address                :string
#  address_details        :string
#  zipcode                :string
#  city                   :string
#  country                :string
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable :registerable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  STATUSES = ["active", "inactive"]

  has_many :posts
  has_many :orders
  has_many :purchases, through: :orders

  validates :first_name, :last_name, :email, :role, :status, presence: true
  validates :status, inclusion: { in: STATUSES }

  scope :active, -> { where(status: "active") }

  def admin?
    role == "admin"
  end

  def user?
    role == "user"
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
