class Foodhistory < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :likes
  has_many :users, through: :likes
  has_many :foodhistory_images, dependent: :destroy
  accepts_nested_attributes_for :foodhistory_images,
    allow_destroy: true,
    reject_if: proc { |attributes| attributes['avatar'].blank? && attributes['avatar_cache'].blank? }
  enum mode: { pri: 0, pub: 1 }
  scope :daily_basis, -> (user, date) { where(user: user, created_at: date.beginning_of_day...date.end_of_day) }

  def can_access?(user)
    pub? || can_edit?(user)
  end

  def can_edit?(user)
    user == self.user
  end

  def liked_by?(user)
    likes.where(user: user).first&.activate_status?
  end

  def like(user)
    Like.transaction do
      like = likes.find_by(user: user) || likes.create!(user: user)
      like.activate_status!
      like.foodhistory.user.notifications.create!(like: like)
    end
    UserMailer.like_notification_email(user, self).deliver_later
  end

  def unlike(user)
    likes.find_by!(user: user).inactivate_status!
  end
end
