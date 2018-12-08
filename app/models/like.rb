class Like < ApplicationRecord
  belongs_to :user
  belongs_to :foodhistory

  scope :by_user_and_foodhistory, -> (user, foodhistory) { where(user: user, foodhistory: foodhistory) }
end
