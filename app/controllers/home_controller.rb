require 'bcrypt'
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
  def display_msg
p params[:emailid]
p params[:token]
  end
  def check
    requestor=Requestor.find_by_emailId(params[:emailId])
    @token=random_token
    if requestor
      
      #redirect_to  home_index_path,notice: "Reset Password linked mailed to your registered email id "+@token
      if requestor.update_column(:pwdtoken,@token)
      redirect_to  display_msg_path(:emailId=>params[:emailId],:token=>@token),notice: "Reset Password linked mailed to your registered email id "
      else 
        redirect_to  home_index_path,notice: params[:emailId]+" The error update password token."
      end
    else
      redirect_to  home_index_path,notice: params[:emailId]+" The error user ID does not exist."
  end
end



    def reset_pwd
      requestor=Requestor.find_by_emailId(params[:emailId])
     p "Email id in reset "+params[:emailId]
     p "Token in reset : "+params[:pwdtoken]
      if requestor && requestor.pwdtoken == params[:pwdtoken]
        #redirect_to  home_index_path,notice: "Reset Password linked mailed to your registered email id "+@token
        p requestor.pwdtoken
        my_password = BCrypt::Password.create(params[:password])
        p "Password hash : "+my_password
        if requestor.update_columns(password_digest:my_password,pwdtoken:nil)
          
        redirect_to  home_index_path,notice: "Reset Password of "+params[:emailId]+" is successfull"
        else 
          redirect_to  home_index_path,notice: params[:emailId]+" The error update password ."
        end
      else
        redirect_to  home_index_path,notice: params[:emailId]+" Error : User doest not exist or token mismatch"
      end
      #flash.now[:alert]="Email or Password is invalid"
      #render ""
    end
    def random_token(size=64)
      #(0...64).map{('a'...'z').to_a[rand(26)]}.join
      charset =%w{ A B C D E F G H I J K L  M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9 # * $ _ + }
      (0...size).map{ charset.to_a[rand(charset.size)] }.join
    end

end
