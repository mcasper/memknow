class WelcomeEmail
  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def welcome
    if Rails.env.production?
      RestClient.post ENV["API_URL"] + "/messages",
        from: "study@memknow.com",
        to: "#{user.email}",
        subject: "You + Memknow = Genius",
        text: message
    end
  end

  def message
    File.read("app/views/welcome_email/welcome.text.erb")
  end
end
