class UserMailer < ApplicationMailer
  def like_notification_email(user, foodhistory)
    @user = user
    @foodhistory = foodhistory
    mail(to: @foodhistory.user.email, subject: 'いいね！')
  end
end
