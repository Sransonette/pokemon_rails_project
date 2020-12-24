class SessionsController < ApplicationController

  before_action :require_login, only: [:destroy]
  
  def new
    @trainer = Trainer.new
  end

  def omniauth 
    trainer = Trainer.find_or_create_by_omniauth(auth)
    if trainer.valid?
      session[:trainer_id] = trainer.id
      redirect_to trainer_path(trainer)  
    else
      #flash[:error] = user.errors.full_messages.join(", ")
      redirect_to root_path
    end
  end


  def create
    @trainer = Trainer.find_by(username: params[:trainer][:username])
    if @trainer && @trainer.authenticate(params[:trainer][:password])
      session[:trainer_id] = @trainer.id
      redirect_to trainer_path(@trainer)
    else
      flash[:error] = "Invalid username or password"
      redirect_to root_url
    end
  end
  
  def destroy
    session.delete :username
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']

  end



end


