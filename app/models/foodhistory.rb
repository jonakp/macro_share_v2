class Foodhistory < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :users, through: :likes
  has_many :foodhistory_images, dependent: :destroy
  accepts_nested_attributes_for :foodhistory_images
  enum mode: { pri: 0, pub: 1 }
  scope :daily_basis, -> (user, date) { where(user: user, created_at: date.beginning_of_day...date.end_of_day) }

  def can_access?(user)
    pub? || can_edit?(user)
  end

  def can_edit?(user)
    user == self.user
  end

  def liked_by?(user)
    likes.where(user: user).present?
  end

  def like(user)
    likes.transaction do
      like = likes.create!(user_id: user.id)
      like.foodhistory.user.notifications.create!(like_id: like.id)
    end
    UserMailer.with(user: user, like: likes.find_by(user: user)).like_notification_email.deliver_later!
  end

  def unlike(user)
    likes.find_by!(user_id: user.id).destroy
  end
end
