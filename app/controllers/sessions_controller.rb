class SessionsController < ApplicationController
  helper_method :home_page?
  def home_page?
    false
  end
  def new
  end

  def create
    requestor=Requestor.find_by_emailId(params[:emailId])
    if requestor && requestor.authenticate(params[:password])
       session[:u_admin_id] = nil
      session[:user_id]=requestor.id
      #session[:admin_call]=params[:admin_call]
      redirect_to  req_dashboard_path,notice:"Logged In"
   # end
    else
     # if session[:admin_call]
     # redirect_to admin_login_path,notice:"Invalid credentials "
   # else
       redirect_to req_login_path,notice:"Invalid credentials"
   # end
      #flash.now[:alert]="Email or Password is invalid"
      #render ""
    end

  end

  def destroy

    if session[:admin_call]
    session[:user_id]=nil
    redirect_to admin_login_path,notice:"Logged out"
  else
    session[:user_id]=nil
    redirect_to root_url,notice:"Logged out"
    end

  end
end
