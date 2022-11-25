class DashboardController < ApplicationController
  before_action :require_user_logged_in!
  helper_method :home_page?
  def home_page?
      false
  end
  def index
  end

  
end
