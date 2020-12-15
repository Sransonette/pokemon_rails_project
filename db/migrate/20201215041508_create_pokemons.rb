class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
    t.string :name
    t.string :pokemon_type
    t.belongs_to :trainer, index: true, foreign_key: true
    end
  end
end