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
end
