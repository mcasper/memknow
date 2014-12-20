class WelcomeEmail < ActionMailer::Base
  default from: "study@memknow.com"

  API_KEY = "key-5c882c3bef7fb13442232a587543ce20"
  API_URL = "https://api:#{API_KEY}@api.mailgun.net/v2/cattmasper.com"

  def welcome(user)
    @user = user

    RestClient.post API_URL+"/messages",
      from: "study@cattmasper.com",
      to: "#{@user.email}",
      subject: "This is subject",
      text: "Text body"
  end
end
