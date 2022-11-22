class SessionsController < ApplicationController
  def new
  end

  def create
    requestor=Requestor.find_by_emailId(params[:emailId])
    if requestor && requestor.authenticate(params[:password])
      session[:user_id]=requestor.id
      redirect_to root_url,notice:"Logged In"
    else
      flash.now[:alert]="Email or Password is invalid"
      render "new"
    end 

  end

  def destroy
    session[:user_id]=nil 
    redirect_to root_url,notice:"Logged out"
  end
end
