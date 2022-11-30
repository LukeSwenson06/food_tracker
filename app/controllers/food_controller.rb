class FoodController < ApplicationController
    def index
        @food = Food.all
    end

    def new
        
    end
end