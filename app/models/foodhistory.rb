class Foodhistory < ApplicationRecord
  belongs_to :user
  enum mode: { pri: 0, pub: 1 }

  # 以下の2つのメソッドは上手く1つにまとめる方法はないか、要検討
  def can_access?(user)
    pub? || can_edit?(user)
  end

  def can_edit?(user)
    user == self.user
  end
end
