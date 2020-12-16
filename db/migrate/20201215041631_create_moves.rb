class CreateMoves < ActiveRecord::Migration[6.0]
  def change
    create_table :moves do |t|
      t.string :name
      t.integer :pokemon_move_id
    end
  end
end
