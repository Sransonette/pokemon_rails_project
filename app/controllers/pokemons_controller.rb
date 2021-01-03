class PokemonsController < ApplicationController

  before_action :require_login

  # def create
  
  #   @pokemon = Pokemon.new(pokemon_params)
  #   if @pokemon.save
  #     redirect_to trainer_path(@pokemon)
  #   else
  #     redirect_to pokemon_path
  #   end
  # end

  # def edit
  #   if @pokemon = current_pokemon
  #     @pokemon = current_pokemon
  #   else
  #     render :edit
  #   end
  # end

  # def update
  #   @pokemon = current_pokemon
  #   if @pokemon.update(pokemon_params)
  #     redirect_to trainer_belt_path(current_trainer, @belts)
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   current_pokemon.destroy
  #   redirect_to trainer_path(current_user)
  # end

  private
  def pokemon_params
    params.require(:pokemon).permit(:name, :pokemon_type)
  end
end
