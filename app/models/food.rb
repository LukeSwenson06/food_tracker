class Food < ApplicationRecord
    validates_presence_of :name, :category
    has_many :cabinets 
    has_many :freezers 
    has_many :refridgerators 
    has_many :others
end