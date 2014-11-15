class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      render :show
    end
  end

  private

  def user_params
    params.require(:user)
  end
end
