class Food < ApplicationRecord
    validates_presence_of :name, :category
    belongs_to :cabinet 
    belongs_to :freezer 
    belongs_to :refridgerator 
    belongs_to :miscellaneous
end