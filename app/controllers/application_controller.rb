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
  
  def current_admin
    @current_user ||= User.find(session[:user_id]) if (session[:user_id] && session[:role] == "admin")
  end
  helper_method :current_admin

  def authorize
    unless current_user
      session[:original_target] = request.url
      flash[:danger] = "You must be logged in to view that page"
      redirect_to login_url
    end
  end
  
  def authorize_admin
    authorize
    
    unless session[:role] == "admin"
      session[:original_target] = request.url
      flash[:danger] = "Only administrator can access this page"
      forbidden
    end
  end
  

  # method name inspired by plataformatec/devise, 
  # implementation is mine though
  def user_signed_in?
    current_user != nil
  end
  helper_method :user_signed_in?


  def forbidden
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/422", layout: false, status: :forbidden }
      format.json { head :forbidden }
    end
  end
  
  def not_found
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404", layout: false, status: :not_found }
      format.json { head :not_found }
    end
  end
  
  def error
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/500", layout: false, status: :error }
      format.json { head :error }
    end
  end


end
