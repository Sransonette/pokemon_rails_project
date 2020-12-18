class Trainer < ApplicationRecord
    has_secure_password
    has_many :belts
    has_many :pokemon, through: :belts
    validates_uniqueness_of :username
    validates :username, presence: true
    validates :email, presence: true

end
