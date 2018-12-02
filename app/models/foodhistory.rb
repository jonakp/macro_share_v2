class Foodhistory < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :users, through: :likes
  enum mode: { pri: 0, pub: 1 }

  def can_access?(user)
    pub? || can_edit?(user)
  end

  def can_edit?(user)
    user == self.user
  end

  def liked_by?(user)
    user.liked_foodhistories.find_by(id: id).present?
  end

  def like(user)
    likes.create!(user_id: user.id)
  end

  def unlike(user)
    likes.find_by!(user_id: user.id).destroy
  end
end
