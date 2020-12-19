class ApplicationController < ActionController::Base

    def home
        redirect_to login_path
    end

    def current_user
        if session[:trainer_id]
            @current_user = Trainer.find_by(id: session[:trainer_id])
        end
    end

    def logged_in?
        !!current_user
    end

    helper_method :current_user

end
