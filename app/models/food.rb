class Food < ApplicationRecord
    validates_presence_of :name, :category

    def self.oldest_to_newest
        order(expiration_date: :asc)
        
    end
end