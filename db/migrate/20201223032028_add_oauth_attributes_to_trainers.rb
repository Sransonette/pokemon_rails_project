class AddOauthAttributesToTrainers < ActiveRecord::Migration[6.0]
  def change
    add_column :trainers, :uid, :string
    add_column :trainers, :provider, :string
  end
end
