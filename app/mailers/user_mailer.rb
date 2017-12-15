class UserMailer < ApplicationMailer
  def ask_for_friendship(user, target)
    @user = user  # Instance variable => available in view
    @target = target

    mail(to: @target.email, subject: 'Vous avez une invitation en attente sur Swaplab')
    # This will render a view in `app/views/user_mailer/ask_for_friendship`!
  end

  def send_request(user, target, missing_item)
    @missing_item = missing_item
    @target = target.user
    mail(to: @target.email, subject: "#{user.first_name} #{user.last_name} a besoin d'aide : #{missing_item.name} ")
    # This will render a view in `app/views/user_mailer/send_request!
  end
end
