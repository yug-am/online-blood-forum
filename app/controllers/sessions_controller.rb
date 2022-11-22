class SessionsController < ApplicationController
  def new
  end

  def create
    requestor=Requestor.find_by_emailId(params[:emailId])
    if requestor && requestor.authenticate(params[:password])
      session[:user_id]=requestor.id
      if requestor.isAdmin
redirect_to admin_dashboard_path,notice:"Logged In"
      else
      redirect_to admin_login_path,notice:"Logged In"
    end
    else
      redirect_to req_login_path,notice:"Invalid credentials" 
      #flash.now[:alert]="Email or Password is invalid"
      #render ""
    end 

  end

  def destroy
    session[:user_id]=nil 
    redirect_to root_url,notice:"Logged out"
  end
end
