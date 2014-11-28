class UsersController < ApplicationController
  skip_before_filter :authenticate, only: [:new, :create]

  def new
    if signed_in?
      redirect_to user_path(current_user.id)
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)

    if User.find_by_email(@user.email)
      flash[:error] = "An account with this email already exists"
      render :new
    elsif @user.save
      redirect_to user_path(@user)
    else
      flash[:error] = "Missing something"
      render :new
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
