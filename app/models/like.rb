class Like < ApplicationRecord
  belongs_to :user
  belongs_to :foodhistory
  has_many :notification, dependent: :destroy

  enum status: { inactivate: 0, activate: 1 }, _suffix: true
  scope :by_user_and_foodhistory, -> (user, foodhistory) { where(user: user, foodhistory: foodhistory) }
end
