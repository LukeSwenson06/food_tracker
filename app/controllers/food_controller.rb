class FoodController < ApplicationController
    def index
        @cabinet = Cabinet.all
        @fridge = Refridgerator.all
        @freezer = Freezer.all
        @other = Other.all
    end
end