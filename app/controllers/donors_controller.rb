class DonorsController < ApplicationController
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
            redirect_to new_donor_path
        end
    end

    private
    def donor_params
        params.require(:donor).permit(:firstName,:middleName,:lastName,:email,:age,:mobileNo,:gender,:location,:bloodGroup,:donorID,:govtID,:isUsed,:lastGivenDate)
    end
end
