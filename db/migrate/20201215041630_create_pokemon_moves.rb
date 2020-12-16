class CreatePokemonMoves < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemon_moves do |t|
      t.string :move_name
      t.belongs_to :pokemon
      t.belongs_to :move
    end
  end
end