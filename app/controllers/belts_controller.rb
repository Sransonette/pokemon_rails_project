class BeltsController < ApplicationController
  def index
    @belts = Belt.all
  end

  def show
    @trainer = Trainer.find(params[:username])
      @belt = Belt.find(params[:id])
  end

  def new
    @belts = Belt.new
  end

  def create 
  
    if !belt_params.blank?
      @belts = Belt.new(belt_params)
      @belts.trainer = current_user
      if @belts.save
        redirect_to belts_path
      else
       
        raise @belts.errors.inspect
        render :new
      end
    else 
      render :new
    end
  end

  def edit
    @belt = Belt.find(params[:id])
    render :edit
  end

  def update
    @belts = Belt.find(params[:id])
    if @belts.update(belt_params)
      redirect_to trainer_belt_path(current_user, @belts)
    else
      render :edit
    end
  end

  def destroy
    Belt.find(params[:id]).destroy
    redirect_to trainer_path(current_user)
  end

  private

  def belt_params
    params.require(:belt).permit(:belt_name, :tier, :trainer_id, :pokemon_id, pokemon_attributes: [:name, :pokemon_type])
  end
end
