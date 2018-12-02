class Like < ApplicationRecord
  belongs_to :user
  belongs_to :foodhistory

  scope :specify_by_user_foodhistory, -> (user, foodhistory) { find_by(user_id: user.id, foodhistory_id: foodhistory.id) }
end
