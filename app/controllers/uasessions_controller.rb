class UasessionsController < ApplicationController
  def new
    @user = UAdmin.new
  end

  def create
   user = UAdmin.find_by(usern: params[:usern])
   if user.present? && user.authenticate(params[:password])
   # puts "in if"
    session[:u_admin_id] = user.id
       redirect_to admin_dashboard_path, notice: "Logged In Successfully"
    else
      #puts "in else"
       flash[:alert]="Email or Password is invalid"
  end
end


   def destroy
     session[:u_admin_id] = nil
     redirect_to root_path, notice: "Logged Out"
   end
 end
