class AdminController < ApplicationController
  def error_pg
  end
  def dashboard
    $is_admin=true
    dig=4
    init=10**(dig-1)
    final=10**(dig)-1
    @rand_conf_num=rand(init...final)
     @requests=Request.all
     @request_allo=""
     @donor_allo=""
     @donor_id_allo=""
     @last_allocation=""
    if $is_admin
   
    if params[:did]
      @request_allo =Request.find_by(requestID:params[:rid]  )
      if not @request_allo.isConfirmed
      @allocation_here=true
       
       @donor_allo = Donor.find_by(id:params[:did])
       @donor_id_allo= @donor_allo.id

       #user = User.find_by(name: 'David')
      @donor_allo.update(isUsed: true)
        @request_allo.update(isConfirmed: true,allocationCode:@rand_conf_num)


       temp_time=@donor_allo.updated_at.in_time_zone(TZInfo::Timezone.get('Asia/Kolkata'))
       @last_allocation= temp_time.to_time.strftime("at %-I:%M %p, %dth %B '%Y")
     end
     end
      end

  end
  def handle_req
    @request=""
    @donors="" 
    if $is_admin
    @donors=Donor.all
    
    @request =Request.find_by(requestID:params[:id])
    @gp=@request.bloodType
    #@donorsPost.where(user_id: @user.id)
    @donors=Donor.where(bloodGroup:@gp)
    @donors=@donors.where(isUsed:false)
    #@request =Request.find(params[:id]) 
  end
    end
  

  end