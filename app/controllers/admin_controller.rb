class AdminController < ApplicationController
  def dashboard
    @requests=Request.all
     @request_allo=""
     @donor_allo=""
     @donor_id_allo=""
     @last_allocation=""
    if params[:did]
      @allocation_here=true
       @request_allo =Request.find_by(requestID:params[:rid]  )
       @donor_allo = Donor.find_by(donorID:params[:did])
       @donor_id_allo= @donor_allo.donorID
       @last_allocation=@donor_allo.last_allocation

    end

  end
  def handle_req
    @request =Request.find_by(requestID:params[:id])
    @gp=@request.bloodType
    #@donorsPost.where(user_id: @user.id)
    @donors=Donor.where(bloodGroup:@gp)
    #@request =Request.find(params[:id]) 

    end
  def allocate(rid,did)
    #params.require(:rid, :did)
    request =Request.find_by(requestID:params[:rid]  )
    donor = Donor.where(donorID:params[:did])
    puts request
    puts donor
    puts rid 
    puts did
    end

  end