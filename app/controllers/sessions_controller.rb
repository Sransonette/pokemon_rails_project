class SessionsController < ApplicationController
  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.find_by(username: params[:trainer][:username])
    if @trainer && @trainer.authenticate(password: params[:trainer][:password])
      session[:trainer_id] = @trainer.id
      redirect_to trainer_path(@trainer)
    else
      render :new
  end
  
  def destroy
    if !session[:username].nil?
      session.delete :username
    end
  end
end
end


