class ApplicationController < ActionController::Base

    def home
        redirect_to login_path
    end

    def current_user
        if session[:username]
            @current_user = Trainer.find(session[:username])
        end
    end

    def logged_in?
        !!current_user
    end

    helper_method :current_user

end
