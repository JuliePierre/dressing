class UserMailerPreview < ActionMailer::Preview
  def ask_for_friendship
    user = User.first
    UserMailer.ask_for_friendship(user)
  end
end
