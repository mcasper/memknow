class WelcomeEmail
  attr_accessor :user

  API_KEY = "key-5c882c3bef7fb13442232a587543ce20"
  API_URL = "https://api:#{API_KEY}@api.mailgun.net/v2/cattmasper.com"

  def initialize(user)
    @user = user
  end

  def welcome
    RestClient.post API_URL+"/messages",
      from: "study@cattmasper.com",
      to: "#{user.email}",
      subject: "You + Memknow = Genius",
      text: message
  end

  def message
    File.read("app/views/welcome_email/welcome.text.erb")
  end
end
