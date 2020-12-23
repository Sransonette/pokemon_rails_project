class Trainer < ApplicationRecord
    has_secure_password
    has_many :belts
    has_many :pokemon, through: :belts
    validates_uniqueness_of :username
    validates :username, presence: true
    validates :email, presence: true

    def self.find_or_create_by_omniauth(auth)
        Trainer.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['first_name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(10..15)
        end
    end


end
