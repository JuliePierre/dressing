class UserMailer < ApplicationMailer
  def ask_for_friendship(user, target)
    @user = user  # Instance variable => available in view
    @target = target

    mail(to: @target.email, subject: 'Vous avez une invitation en attente sur Swaplab')
    # This will render a view in `app/views/user_mailer`!
  end
end
