class HomeController < ApplicationController
  helper_method :home_page?
  def home_page?
      true
  end
  def index
  end

  def new
  end
  def forgot_password

  end

  def create
    requestor=Requestor.find_by_emailId(params[:emailId])
    if requestor
       
    else
      redirect_to  home_index_path,notice: params[:emailId]+" The error user ID does not exist."
    end
    
      #flash.now[:alert]="Email or Password is invalid"
      #render ""
  

  end
end
