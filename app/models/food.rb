class Food < ApplicationRecord
    validates_presence_of :name, :category

    def self.oldest_to_newest
        order(expiration_date: :asc)
        
    end

    def self.alphabetically_asc
       order(name: :asc) 
    end

    def self.category_asc
        order(category: :asc, name: :asc)
    end
end