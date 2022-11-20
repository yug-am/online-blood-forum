class AdminController < ApplicationController
  def dashboard
     
     # puts Request.all
    @requests = Request.all
    #@donors = Donor.all


  #@requests
  end
  def handle_req
    @request =Request.find_by(requestID:params[:id])
    @gp=@request.bloodType
    #@donorsPost.where(user_id: @user.id)
    @donors=Donor.where(bloodGroup:@gp)
    #@request =Request.find(params[:id]) 
end

end