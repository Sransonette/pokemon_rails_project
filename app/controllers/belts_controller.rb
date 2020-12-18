class BeltsController < ApplicationController
  def index
    @trainer = current_user.belts
    @belts = Belt.all
  end

  def show
    @trainer = Trainer.find(params[:username])
      @belt = Belt.find(params[:id])
  end

  def new
    
    if @trainers = Trainer.find_by_id(params[:trainer_id])
      @belts = @trainers.belts.build(belt_params)
    else
      @belts = Belt.new
    end
  end

  def create 
    
    @belts = Belt.new(belt_params)
    if @belts.save
      redirect_to belts_path
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
    params.require(:belts).permit(:belt_name, :tier)
  end
end
