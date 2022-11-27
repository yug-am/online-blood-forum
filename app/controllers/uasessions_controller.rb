class UasessionsController < ApplicationController
  def new
  end

  def create
   user = UAdmin.find_by(usern: params[:usern])
   if user.present? && user.authenticate(params[:password])
       session[:u_admin_id] = user.id
       redirect_to admin_dashboard_path, notice: "Logged In Successfully"
  end
end


   def destroy
     session[:u_admin_id] = nil
     redirect_to root_path, notice: "Logged Out"
   end
 end
