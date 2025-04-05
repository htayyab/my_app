class SessionsController < ApplicationController

def new
    
end

def create
 user=User.find_by(email: params[:session][:email].downcase)
 if user && user.authenticate(params[:session][:password])
   flash[:notice] = "User login "
   redirect_to user
 else
    flash[:alert] =  "something is Wrong!!!"
    redirect_to login_path
 end
end

def destroy

end

end
