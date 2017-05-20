class SessionsController < ApplicationController
  def new
  end

  def create
    # login as admin
    user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		flash[:success] = "You have successfully logged in"
  		redirect_to root_url
  	else
  		flash[:danger] = "Invalid email/password combination"
  		redirect_to login_url
  	end
    
  	
  end

  def destroy
  	session[:user_id] = nil
  	flash[:success] = "You have successfully logged out"
  	redirect_to login_url
  end
end
