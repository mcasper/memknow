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
    @user = User.new(user_params.merge(email: user_params[:email].downcase))

    if User.find_by(email: @user.email)
      flash[:error] = "An account with this email already exists"
      render :new
    elsif @user.save
      WelcomeEmail.new(@user).welcome
      sign_in @user
      if params[:user][:flashcard]
        scheduled_review = @user.scheduled_reviews.create(scheduled_date: Date.tomorrow)
        @user.flashcards.create(question: params[:user][:flashcard][:question], answer: params[:user][:flashcard][:answer], scheduled_review: scheduled_review)
      end

      render :show
    else
      flash[:error] = "Please enter a valid email address and password"
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
