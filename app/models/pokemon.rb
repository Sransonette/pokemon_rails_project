class Pokemon < ApplicationRecord
    has_many :belts
    has_many :trainers, through: :belts
    validates :name, presence: true
    validates :pokemon_type, presence: true
end
