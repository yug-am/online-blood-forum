class ApplicationController < ActionController::Base
  helper_method :current_requestor
  def current_requestor
      if session[:user_id]
          @current_requestor||=Requestor.find(session[:user_id])
      else
          @current_requestor=nil
      end
  end

  def require_user_logged_in!
      # allows only logged in user
      redirect_to req_login_path, alert: 'You must be signed in' if current_requestor.nil?
    end
      def require_admin_logged_in!
      # allows only logged in user
      redirect_to req_login_path, alert: 'Admin must be signed in' if( current_requestor.nil? ||(not current_requestor.isAdmin) )
    end
end
