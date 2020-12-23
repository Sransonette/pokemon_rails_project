class Belt < ApplicationRecord
    belongs_to :pokemon 
    belongs_to :trainer
    validates :belt_name, presence: true

    accepts_nested_attributes_for :pokemon

    

   

    # def pokemon_attributes=(pokemon_attributes)
    #     pokemon_attributes.values.each do |pokemon_attributes|
    #     if pokemon_attributes[:description] != "" && pokemon_attributes[:priority] != ""
    #         pokemon = Pokemon.find_or_create_by(pokemon_attributes)
    #         self.pokemon = pokemon
    #     end
    #     end
    # end

end
