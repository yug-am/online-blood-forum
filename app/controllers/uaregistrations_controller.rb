class UaregistrationsController < ApplicationController
def new
  @user = UAdmin.new
  end

  def create
    @user = UAdmin.new(user_params)
    #User.new({email:"bob@bob",password:"password"})
    if @user.save
      session[:u_admin_id] = @user.id
      redirect_to admin_dashboard_path, notice: "Succefuly created account"
    else
      flash[:alert] = "Something went wrong"
      render :new
  end
end

  def user_params
    params.require(:u_admin).permit(:usern, :password, :password_confirmagtion)
  end
end


