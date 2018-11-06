class User < ApplicationRecord
  has_many :userfeatures
  has_many :foodhistories
  enum gender: { not_known: 0, male: 1, female: 2, not_applicable: 9 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
