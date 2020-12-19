class PokemonsController < ApplicationController
  
  def index
    @pokemon = current_user.pokemon
    redirect_to pokemon_index_path
  end  

  def show
    @trainer = Trainer.find(params[:username])
      @pokemon = Pokemon.find(params[:id])
  end
  
  def new
    @trainer = current_user
    @pokemon = Pokemon.new
    
  end

  def create
  
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      redirect_to trainer_path(@pokemon)
    else
      redirect_to pokemon_path
    end
  end

  def edit
    @pokemon = Pokemon.find(params[:username])
    render :edit
  end

  def update
    @pokemon = Pokemon.find(params[:username])
    if @pokemon.update(pokemon_params)
      redirect_to trainer_pokemon_path(current_user, @pokemon)
    else
      render :edit
    end
  end

  def destroy
    Pokemon.find(params[:id]).destroy
    redirect_to trainer_path(current_user)
  end

  private
  def pokemon_params
    params.require(:pokemon).permit(:name, :pokemon_type)
  end
end
