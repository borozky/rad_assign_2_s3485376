class SessionsController < ApplicationController
  def new
  end

  def create
    # login as admin or normal user
    if params[:email] == "admin"
      user = User.where(role: "admin").first
    else
      user = User.where(role: params[:email]).first
    end
    
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		session[:role] = user.role
  		
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
