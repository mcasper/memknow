class SessionsController < ApplicationController
  skip_before_filter :authenticate, only: [:new, :create]

  def new
    if signed_in?
      redirect_to users_path
    end
  end

  def create
    user = User.find_by(
      email: params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to action: :show, controller: "users", id: user.id
    else
      redirect_to signin_path
    end
  end

  def destroy
    sign_out
    redirect_to signin_path
  end
end
