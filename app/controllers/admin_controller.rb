class AdminController < ApplicationController
  def dashboard
     
     # puts Request.all
    @requests = Request.all
  #@requests
  end
  def handle_req
   # .find_by(name: 'David')
    @request =Request.find_by(requestID:params[:id])
    #@request =Request.find(params[:id]) 
end
end