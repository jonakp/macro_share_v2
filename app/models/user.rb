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

  # <Issue#20>
  # userfeatures_controllerから、userfeature_idを受け取った場合は、
  # user modelからculcurate_calorie_macroを行う
  # 詳細はuserfeatures_controllerの、confirm_userfeature_update_skipメソッドを参照
  def update_calorie_macro
    userfeatures.find(userfeature_id).save if userfeature_id.present?
  end

  def foodhistories_per_day
    # ひとまず暫定で、対応するユーザのfoodhistoryを、
    # 全て表示する形にする
    foodhistories
  end

  def primary_userfeature
    # ひとまず暫定で、最初に登録したuserfeatureを、
    # primary-userfeatureとする
    # primary-userfeature = 現在採用しているuserfeature
    userfeatures.first
  end
end
