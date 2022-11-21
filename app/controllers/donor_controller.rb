class DonorController < ApplicationController
    def new_donor_form
        @donor = Donor.new #create
        @donors = Donor.all #get all donors
end

    def create
        @donor = Donor.new(donor_params)
        if @donor.save #save into sql
            redirect_to new_donor_path
        end
    end

    private
    def donor_params
        params.require(:donor).permit(:firstName,:middleName,:lastName,:email,:age,:mobileNo,:gender,:location,:bloodGroup,:donorID,:govtID,:isUsed,:lastGivenDate)
    end

end

