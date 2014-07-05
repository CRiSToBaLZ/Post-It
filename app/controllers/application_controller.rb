class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?

  before_filter :set_user_time_zone

  def set_user_time_zone
    Time.zone = current_user.time_zone if logged_in?
  end

  def current_user
    # if there's an authenticated user, return the user obj
    # else return nil
    
    @current_user ||= User.find(session[:user_id]) if session[:user_id]

  end
  
  def logged_in?
    !!current_user
  end
  
  def require_user
    access_denied unless logged_in?
  end
      
  def require_admin
    access_denied unless logged_in? and current_user.admin?
  end

  def require_creator
    access_denied unless logged_in? and (current_user.admin? or current_user == @post.user)
  end

  def access_denied
    flash[:error] = "You can't do that."
    redirect_to root_path
  end


  
end