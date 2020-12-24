class TrainersController < ApplicationController
  before_action :require_login

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.create(trainer_params)
    if trainer.valid?
      session[:trainer_id] = trainer.id
      redirect_to trainer_path(@trainer)
    else
      flash[:error] = "All forms must be filled to proceed"
      redirect_to signup_path
    end
  end

  def show
    @trainer = Trainer.find_by(params[:username])
  end

  private
  def trainer_params
    params.require(:trainer).permit(:username, :email, :password)
  end

end
