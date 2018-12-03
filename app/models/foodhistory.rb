class Foodhistory < ApplicationRecord
  belongs_to :user
  enum mode: { pri: 0, pub: 1 }
  scope :daily_basis, -> (user, date) { where(user: user, created_at: date.beginning_of_day...date.end_of_day) }

  def can_access?(c_user)
    pub? || own?(c_user)
  end

  def own?(c_user)
    c_user == user
  end
end
