class Foodhistory < ApplicationRecord
  belongs_to :user
  enum mode: { pri: 0, pub: 1 }

  def can_access?(current_user)
    pub? || current_user.id == user.id
  end

  def can_edit?(current_user)
    current_user.id == user.id
  end
end
