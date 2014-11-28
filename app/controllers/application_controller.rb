class ApplicationController < ActionController::Base
  include SessionsHelper
  include ApplicationHelper

  protect_from_forgery with: :exception

  before_action :authenticate

  def authenticate
    if signed_in?
      set_variables
    else
      redirect_to signin_path
    end
  end

  def set_variables
    
  end
end
