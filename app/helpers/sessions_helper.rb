module SessionsHelper
  def signed_in?
    current_user.present?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) || GuestUser.new
  end

  def sign_in(user)
    session[:user_id] = user.id
    current_user = user
  end

  def sign_out
    self.current_user = nil
    session[:user_id] = nil
  end
end
