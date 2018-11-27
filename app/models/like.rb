class Like < ApplicationRecord
  belongs_to :user
  belongs_to :foodhistory

  def self.like_id(user, foodhistory)
    Like.find_by(user_id: user.id, foodhistory_id: foodhistory.id).id
  end
end
