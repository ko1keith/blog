class ApplicationController < ActionController::Base

    #return details of user who is logged in
    #available in all controllers
    helper_method :current_user, :logged_in?
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    #check if we have user who is logged in
    def logged_in?
        #!! turns object into boolean
        !!current_user
    end
    
end
