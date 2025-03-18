class ApplicationController < ActionController::Base
#   before_action :debug_session

# def debug_session
#   Rails.logger.debug "Session User ID: #{session[:user_id]}"
# end


  helper_method :current_user, :logged_in?
  def current_user 
    @current_user ||= User.find(session[:user_id])if session[:user_id]
  end
  def logged_in?
    !!current_user
  end
 
end
