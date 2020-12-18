class AddTierToBelts < ActiveRecord::Migration[6.0]
  def change
    add_column :belts, :tier, :integer
  end
end
