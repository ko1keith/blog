class SessionsController < ApplicationController
#Sessions allow the application to maintain a user specific state

def new 
end


def create 
    user = User.find_by(email: params[:session][:email].downcase)
    # if user is found and password is authenticated
    if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:notice] = "Logged in successfully."
        redirect_to user
    else
        #flash.now displays as it happens instead of showing when a different page is rendered
        flash.now[:alert] = "There was something wrong with your login details."
        render 'new'
    end
end

#log out
def destroy
    session[:user_id] = nil
    flash[:notice]= "Logged out"
    redirect_to root_path 
end

end