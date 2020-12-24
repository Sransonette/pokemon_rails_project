class ApplicationController < ActionController::Base

    helper_method :current_trainer, :logged_in?, :require_login, :current_belt, :current_pokemon

    def home
        redirect_to login_path
    end

    def current_trainer
        if session[:trainer_id]
            @current_user = Trainer.find_by(id: session[:trainer_id])
        end
    end

    def logged_in?
        !!current_trainer
    end

    def require_login
        redirect_to root_path unless logged_in?
    end

    def current_belt
        if session[:trainer_id]
            @current_belt = Belt.find_by(id: params[:id])
        end
    end

    def current_pokemon
        @current_pokemon = Pokemon.find_by(id: params[:id])
        
    end   

    

    

end
