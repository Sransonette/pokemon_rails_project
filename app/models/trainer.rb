class Trainer < ApplicationRecord
    has_secure_password
    has_many :pokemon
    validates_uniqueness_of :username
    validates :username, presence: true
    validates :email, presence: true

end
