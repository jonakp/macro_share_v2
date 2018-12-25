class Like < ApplicationRecord
  belongs_to :user
  belongs_to :foodhistory
  has_one :notification, dependent: :destroy

  scope :by_user_and_foodhistory, -> (user, foodhistory) { where(user: user, foodhistory: foodhistory) }
end
