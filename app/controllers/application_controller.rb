class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  


  private

  def current_user
   @user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
   !!current_user
  end

  def authenticate_user!
    redirect_to login_path if !logged_in?
  end

  def validate_user
    redirect_to login_path unless current_user
  end

end
