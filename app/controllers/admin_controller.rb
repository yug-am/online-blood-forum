class AdminController < ApplicationController
  def dashboard
     
      puts Request.all
    @requests = Request.all
  @requests
  end
end
