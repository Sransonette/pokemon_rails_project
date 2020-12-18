class CreateBelts < ActiveRecord::Migration[6.0]
  def change
    create_table :belts do |t|
      t.string :belt_name
      t.belongs_to :pokemon
      t.belongs_to :trainer
    end
  end
end