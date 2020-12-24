class BeltsController < ApplicationController
  before_action :require_login

  def index
    @trainer = current_trainer
    @belts = Belt.all
    
  end

  def show
    current_trainer
      @belt = current_belt
      @pokemon = current_pokemon
  end

  def new
      current_trainer
      @belts = Belt.new
      @belts.build_pokemon
  end

  def create 
  
    if !belt_params.blank?
      @belts = Belt.new(belt_params)
      @belts.trainer = current_trainer
      if @belts.save
        redirect_to belts_path
      else
        #flash[:error] = "#{@user.errors.full_messages.to_sentence}."
        render :new
      end
    else 
      #flash[:error] = "#{@user.errors.full_messages.to_sentence}."
       render :new
    end
  end

  def edit

    if @belts = current_belt
      @pokemon = current_pokemon
    else
      render :edit
    end
  end

  def update
    @belts = current_belt
    @pokemon = current_pokemon
    if @belts.update(belt_params)
      redirect_to trainer_belt_path(current_trainer, @belts)
    else
      render :edit
    end
  end

  def destroy
    current_belt.destroy
    redirect_to belts_path
  end

  private

  def belt_params
    params.require(:belt).permit(:belt_name, :tier, :trainer_id, :pokemon_id, pokemon_attributes: [:name, :pokemon_type])
  end
  
end
