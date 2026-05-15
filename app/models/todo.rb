# Added comments for explanation
class Todo < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, presence: true
end