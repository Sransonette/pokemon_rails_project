class PokemonController < ApplicationController
  
  def index
    @pokemon = current_user.pokemon
    redirect_to
  end  
  
  def new
    @pokemon = Pokemon.new
  end

  def create
    
    @pokemon = current_user.pokemon.build(pokemon_params)
    if @pokemon.save
      redirect_to trainer_path(current_user)
    else
      render :new
    end
  end

  def show
    @trainer = Trainer.find(params[:username])
      @pokemon = Pokemon.find(params[:id])
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
