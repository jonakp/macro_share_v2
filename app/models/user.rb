class User < ApplicationRecord
  has_many :userfeatures
  has_many :foodhistories
  accepts_nested_attributes_for :userfeatures
  before_validation :update_calorie_macro
  attr_accessor :userfeature_id

  # 性別の番号は以下に準拠
  # https://qiita.com/aoshirobo/items/32deb45cb8c8b87d65a4
  enum gender: { male: 1, female: 2, not_applicable: 9, not_known: 0 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def update_calorie_macro
    if userfeature_id.present?
      userfeature = userfeatures.find(userfeature_id)
      userfeature.culculate_calorie_macro
      userfeature.save
    end
  end
end
