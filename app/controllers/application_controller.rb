class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # https://gist.github.com/thebucknerlife/10090014
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorise
  	redirect_to login_url unless current_user
  end

  # method name inspired by plataformatec/devise, 
  # implementation is mine though
  def user_signed_in?
    session[:user_id] != nil
  end
  helper_method :user_signed_in?



end
