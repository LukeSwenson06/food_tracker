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
        expect(page).to have_content(food2.name)
        expect(page).to have_content(food2.category)
        expect(page).to have_content(food2.expiration_date)
        expect(page).to have_content(food3.name)
        expect(page).to have_content(food3.category)
        expect(page).to have_content(food3.expiration_date)
        expect(page).to have_content(food4.name)
        expect(page).to have_content(food4.category)
        expect(page).to have_content(food4.expiration_date)
    end

    it 'can take you to a form to add a new food item' do
        visit "/"

        expect(page).to have_link("Add Food")
        click_link "Add Food"
        expect(current_path).to eq("/food/new")
    end

    it 'can order food by expiration date by asc' do
        food1 = Food.create(name: "Pork", category: "Meat", expiration_date: Date.new(2022, 12, 13), brand: "Porkey Industries", location: "Refridgerator")
        food2 = Food.create(name: "Broccoli", category: "Vegetable", expiration_date: Date.new(2022, 12, 12), brand: "Healthy Co", location: "Fridge")
        food3 = Food.create(name: "Ice Cream", category: "Dairy", expiration_date: Date.new(2023, 01, 01), brand: "Pillsbury", location: "Cabinet")
        food4 = Food.create(name: "Chips", category: "Snack", expiration_date: Date.new(2023, 04, 04), brand: "Namico", location: "Cabinet")

        visit '/'
    
        expect(food2.name).to appear_before(food1.name)
        expect(food1.name).to appear_before(food3.name)
        expect(food3.name).to appear_before(food4.name)
    end
    it 'can alphabetically show name asc' do
        food1 = Food.create(name: "Pork", category: "Meat", expiration_date: Date.new(2022, 12, 13), brand: "Porkey Industries", location: "Refridgerator")
        food2 = Food.create(name: "Broccoli", category: "Vegetable", expiration_date: Date.new(2022, 12, 12), brand: "Healthy Co", location: "Fridge")
        food3 = Food.create(name: "Ice Cream", category: "Dairy", expiration_date: Date.new(2023, 01, 01), brand: "Pillsbury", location: "Cabinet")
        food4 = Food.create(name: "Chips", category: "Snack", expiration_date: Date.new(2023, 04, 04), brand: "Namico", location: "Cabinet")

        visit '/'

        click_link "A-Z", :from => "alphabeticalName"
    
        expect(food2.name).to appear_before(food4.name)
        expect(food4.name).to appear_before(food3.name)
        expect(food3.name).to appear_before(food1.name)
    end
end