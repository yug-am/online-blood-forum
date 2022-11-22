class AdminController < ApplicationController

  # has_secure_password

def new
  @admin=Admin.new
end


def error_pg
end



def dashboard
$is_admin = true
dig = 4
init = 10 ** (dig - 1)
final = 10 ** (dig) - 1
@rand_conf_num = rand(init...final)
@requests = Request.all
@request_allo = ""
@donor_allo = ""
@donor_id_allo = ""
@last_allocation = ""
if $is_admin

if params[:did]
@request_allo = Request.find_by(id: params[:rid])
if not @request_allo.isConfirmed
@allocation_here = true
if params[:did] =="-404"
@donor_id_allo = -404
@request_allo.update(isConfirmed: true, allocationCode: -404)
else
  @donor_allo = Donor.find_by(id: params[:did])
@donor_id_allo = @donor_allo.id
@donor_allo.update(isUsed: true)
@request_allo.update(isConfirmed: true, allocationCode: @rand_conf_num)
end
temp_time = @request_allo.updated_at.in_time_zone(TZInfo::Timezone.get('Asia/Kolkata'))
@last_allocation = temp_time.to_time.strftime("%-I:%M %p, %dth %B '%Y")

#user = User.find_by(name: 'David')

end
end
end

end
def handle_req
@request = ""
@donors = ""
if $is_admin
@donors = Donor.all

@request = Request.find_by(id: params[:id])
@gp = @request.bloodType
# @donorsPost.where(user_id: @user.id)
@donors = Donor.where(bloodGroup: @gp)
@donors = @donors.where(isUsed: false)
# @request = Request.find(params[: id])
end
end

def admin_login
#log me in

end

end
