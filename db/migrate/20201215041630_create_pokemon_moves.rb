class CreatePokemonMoves < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemon_moves do |t|
      t.belongs_to :pokemon, index: true, foreign_key: true
      t.belongs_to :move, index: true, foreign_key: true
    end
  end
end