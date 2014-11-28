module SessionsHelper
  def signed_in?
    current_user.present? && @current_user.instance_of?(User)
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    id = session[:user_id]
    if id
      @current_user = User.find(id)
    else
      @current_user = GuestUser.new
    end
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
