class ApplicationController < ActionController::Base
  helper_method :current_requestor, :current_admin

  def current_requestor
      if session[:user_id]
          @current_requestor||=Requestor.find(session[:user_id])
      else
          @current_requestor=nil
      end
  end

  def current_admin
    if session[:u_admin_id]
        @current_admin||=UAdmin.find(session[:u_admin_id])
    else
        @current_admin=nil
    end
    end

  def require_user_logged_in!
      # allows only logged in user
      redirect_to req_login_path, alert: 'You must be signed in' if current_requestor.nil?
    end
      def require_admin_logged_in!
      # allows only logged in admin

         redirect_to admin_login_path, alert: 'Admin must be signed in' if current_admin.nil?
    end
end
