class UserMailer < ApplicationMailer
  def ask_for_friendship(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: 'Someone has invited you to join them on weddingdressing.herokuapp.com')
    # This will render a view in `app/views/user_mailer`!
  end
end
