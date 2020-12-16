class PokemonMove < ApplicationRecord
    has_many :pokemon 
    has_many :moves
    
end
