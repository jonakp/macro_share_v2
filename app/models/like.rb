class Like < ApplicationRecord
  belongs_to :user
  belongs_to :foodhistory

  scope :specify_by_user_foodhistory, -> (user, foodhistory) { where(user: user, foodhistory: foodhistory) }
end
