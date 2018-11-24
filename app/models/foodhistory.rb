class Foodhistory < ApplicationRecord
  belongs_to :user
  enum mode: { pri: 0, pub: 1 }

  # 以下の2つのメソッドは上手く1つにまとめる方法はないか、要検討
  def can_access?(c_user)
    pub? || own?(c_user)
  end

  def own?(c_user)
    c_user == user
  end
end
