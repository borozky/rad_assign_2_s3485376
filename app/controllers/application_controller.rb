class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :get_locations
  before_action :get_categories

  def get_locations
    @locations = Location.all
  end

  def get_categories
    @categories = Category.all
  end

  # https://gist.github.com/thebucknerlife/10090014
  def current_user
  	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    unless current_user
      session[:original_target] = request.url
      flash[:danger] = "You must be logged in to view that page"
      redirect_to login_url
    end
  end

  # method name inspired by plataformatec/devise, 
  # implementation is mine though
  def user_signed_in?
    current_user != nil
  end
  helper_method :user_signed_in?



end
