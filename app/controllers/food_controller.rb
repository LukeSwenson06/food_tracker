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

    def edit
        @food = Food.find(params[:id])
    end

    def update
        food = Food.find(params[:id])
        food.update(food_params)
        if food.save
            flash[:message] = "Your Edit has been Successful!"
            redirect_to root_path
        else
            redirect_to edit_food_path(food.id)
            flash[:alert] = "Please fill out all fields"
        end
    end

private
    def food_params
        params.permit(:name, :category, :expiration_date)
    end
end