class WelcomeEmail < ActionMailer::Base
  default from: "study@memknow.com"

  def welcome(user)
    @user = user

    mail to: "#{@user.email}", subject: "You + Memknow = Genius"
  end
end
