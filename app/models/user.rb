# Added comments for explanation
class User < ApplicationRecord
  has_secure_password

  has_many :categories, dependent: :destroy
  has_many :todos, dependent: :destroy

  validates :first_name, :last_name, :username, :email, presence: true
  validates :username, :email, uniqueness: true
end