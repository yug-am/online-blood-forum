class AdminController < ApplicationController
 before_action :require_admin_logged_in!
  # has_secure_password
  def arequest
  end
def admin_handled_request
  @requests = Request.all
  @requests = @requests.order(updated_at: :desc)

end
def new
  @admin=Admin.new
end


def error_pg
end

#admin lock
#before_action :require_user_logged_in!
def dashboard
$is_admin = false
dig = 6
init = 10 ** (dig - 1)
final = 10 ** (dig) - 1
@rand_conf_num = rand(init...final)
@requests = Request.all
@request_allo = ""
@donor_allo = ""
@donor_id_allo = ""
@last_allocation = ""
#if $is_admin

if params[:did]
@request_allo = Request.find_by(id: params[:rid])
if not @request_allo.isConfirmed
@allocation_here = true
if params[:did] =="-404"
@donor_id_allo = -404
@request_allo.update(isConfirmed: true, allocationCode: -404,locationAllocated:"-404")
else
  @donor_allo = Donor.find_by(id: params[:did])
@donor_id_allo = @donor_allo.id
location_donor = @donor_allo.location
@donor_allo.update(isUsed: true)
@request_allo.update(isConfirmed: true, allocationCode: @rand_conf_num, locationAllocated: location_donor)
end
temp_time = @request_allo.updated_at.in_time_zone(TZInfo::Timezone.get('Asia/Kolkata'))
@last_allocation = temp_time.to_time.strftime("%-I:%M %p, %dth %B '%Y")

#user = User.find_by(name: 'David')

#end
end
end

end
def handle_req
@request = ""
@donors = ""
#if $is_admin
@donors = Donor.all
@donors=@donors.order(created_at: :desc)

@request = Request.find_by(id: params[:id])
@r_location=@request.location
@gp = @request.bloodType
# @donorsPost.where(user_id: @user.id)
@donors = Donor.where(bloodGroup: @gp,location: @r_location)
@donors = @donors.where(isUsed: false)
# @request = Request.find(params[: id])
#end
end

def admin_login
#log me in

end

end
