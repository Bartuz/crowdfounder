class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def require_login
  	redirect_to new_session_path, notice: "Please login first." unless logged_in?
  end

end
