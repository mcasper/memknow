class WelcomeEmail
  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def welcome
    RestClient.post ENV["API_URL"] + "/messages",
      from: "study@cattmasper.com",
      to: "#{user.email}",
      subject: "You + Memknow = Genius",
      text: message
  end

  def message
    File.read("app/views/welcome_email/welcome.text.erb")
  end
end
