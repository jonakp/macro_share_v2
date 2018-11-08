class User < ApplicationRecord
  has_many :userfeatures
  has_many :foodhistories
  # 性別の番号は以下に準拠
  # https://qiita.com/aoshirobo/items/32deb45cb8c8b87d65a4
  # enum gender: { male: 1, female: 2, not_applicable: 9, not_known: 0 }
  enum gender: { not_known: 0, male: 1, female: 2, not_applicable: 9}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end