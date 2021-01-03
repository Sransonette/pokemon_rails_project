module TrainersHelper 

    def welcome_header
        if current_trainer
            "Welcome, #{current_trainer.username}!" 
        end
    end


end
