require 'rails_helper'

RSpec.describe "Index page" do
    it "displays storage containters with food items listed" do
        food1 = Food.create(name: "Pork", category: "Meat", expiration_date: "30 December 2022", brand: "Porkey Industries", location: "Refridgerator")
        food2 = Food.create(name: "Broccoli", category: "Vegetable", expiration_date: "5 December 2022", brand: "Healthy Co", location: "Fridge")
        food3 = Food.create(name: "Ice Cream", category: "Dairy", expiration_date: "5 December 2022", brand: "Pillsbury", location: "Cabinet")
        food4 = Food.create(name: "Chips", category: "Snack", expiration_date: "1 January 2023", brand: "Namico", location: "Cabinet")

        visit "/"

        expect(page).to have_content(food1.name)
        expect(page).to have_content(food1.category)
        expect(page).to have_content(food1.expiration_date)
        expect(page).to have_content(food1.brand)
        expect(page).to have_content(food1.location)
        expect(page).to have_content(food2.name)
        expect(page).to have_content(food2.category)
        expect(page).to have_content(food2.expiration_date)
        expect(page).to have_content(food2.brand)
        expect(page).to have_content(food2.location)
        expect(page).to have_content(food3.name)
        expect(page).to have_content(food3.category)
        expect(page).to have_content(food3.expiration_date)
        expect(page).to have_content(food3.brand)
        expect(page).to have_content(food3.location)
        expect(page).to have_content(food4.name)
        expect(page).to have_content(food4.category)
        expect(page).to have_content(food4.expiration_date)
        expect(page).to have_content(food4.brand)
        expect(page).to have_content(food4.location)
    end

    it 'can take you to a form to add a new food item' do
        visit "/"

        expect(page).to have_link("Add Food")
        click_link "Add Food"
        expect(current_path).to eq("/food/new")
    end
end