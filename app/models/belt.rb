class Belt < ApplicationRecord
    belongs_to :pokemon 
    belongs_to :trainer
    validates :belt_name, presence: true
end
