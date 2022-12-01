class FoodController < ApplicationController
    def index
        @food = Food.all
    end

    def new
    end

    def create
        food = Food.new(food_params)
        if food.save
            redirect_to "/"
            flash[:message] = "Your New Food has been Added!"
        else
            flash[:alert] = "Please fill out all fields"
            redirect_to "/food/new"
        end
    end

private
    def food_params
        params.permit(:name, :category, :expiration_date)
    end
end