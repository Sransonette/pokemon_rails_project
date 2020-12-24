class Trainer < ApplicationRecord
    has_secure_password
    has_many :belts
    has_many :pokemon, through: :belts
    validates :username, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true

    def self.find_or_create_by_omniauth(auth)
        Trainer.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['first_name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(10)
        end
    end


end
