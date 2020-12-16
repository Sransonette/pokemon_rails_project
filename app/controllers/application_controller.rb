class ApplicationController < ActionController::Base

    def home
        redirect_to login_path
    end

end
