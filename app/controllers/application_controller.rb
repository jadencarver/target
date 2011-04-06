class ApplicationController < ActionController::Base
  protect_from_forgery

protected
  def logged_in?
    !session[:user_id].nil?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if logged_in?
  end
  helper_method :current_user

  def require_login
    if logged_in?
      redirect_to new_user_path
    end
  end

  def log_in_as(user)
    user.update_attribute(:logged_in_at, Time.now)
    @current_user = user
    session[:user_id] = user.id
  end

end
