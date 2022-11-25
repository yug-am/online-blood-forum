class DonorsController < ApplicationController
    helper_method :home_page?
    def home_page?
      false
    end
	 def new
	 	#initialize
        @donor = Donor.new 
        @donors = Donor.all 
end

    def create
    	#creation
        @donor = Donor.new(donor_params)
        @donor.isUsed=false
        if @donor.save #save into sql
            redirect_to new_donor_path, alert: 'Donor saved successfully'
             else #save into sql
            redirect_to new_donor_path, alert: 'Save form error'
        end
    end

    private
    def donor_params
        params.require(:donor).permit(:firstName,:middleName,:lastName,:email,:age,:mobileNo,:gender,:location,:bloodGroup,:donorID,:govtID,:isUsed,:lastGivenDate)
    end
end
