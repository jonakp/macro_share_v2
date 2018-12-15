class UserMailer < ApplicationMailer
  def like_notification_email
    @user = params[:user]
    @like = params[:like]
    mail(to: @like.user.email, subject: 'いいね！')
  end
end
