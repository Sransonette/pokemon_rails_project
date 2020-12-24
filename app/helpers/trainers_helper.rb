module TrainersHelper

    def welcome_header
        if current_trainer
            "Welcome, #{current_trainer.first_name}!" 
        end
    end


end
