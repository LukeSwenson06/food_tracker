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

        click_link "A-Z"
        
        expect(food2.name).to appear_before(food4.name)
        expect(food4.name).to appear_before(food3.name)
        expect(food3.name).to appear_before(food1.name)
    end

    it 'can sort by category alphabetically ascending with name alphabetically ascending' do
        food1 = Food.create(name: "Pork", category: "Meat", expiration_date: Date.new(2022, 12, 13), brand: "Porkey Industries", location: "Refridgerator")
        food2 = Food.create(name: "Chicken", category: "Meat", expiration_date: Date.new(2022, 12, 12), brand: "Healthy Co", location: "Fridge")
        food3 = Food.create(name: "Ice Cream", category: "Dairy", expiration_date: Date.new(2023, 01, 01), brand: "Pillsbury", location: "Cabinet")
        food4 = Food.create(name: "Eggs", category: "Dairy", expiration_date: Date.new(2023, 04, 04), brand: "Namico", location: "Cabinet")
        food5 = Food.create(name: "Broccoli", category: "Vegetable", expiration_date: Date.new(2022, 01, 04), brand: "Namico", location: "Cabinet")
        food6 = Food.create(name: "Pomegranate", category: "Fruit", expiration_date: Date.new(2022, 12, 17), brand: "Namico", location: "Cabinet")
            
        visit '/'

        click_link "Sort"
        
        expect(food4.category).to appear_before(food6.category)
        expect(food6.category).to appear_before(food2.category)
        expect(food2.category).to appear_before(food5.category)
        expect(food4.name).to appear_before(food3.name)
        expect(food3.name).to appear_before(food6.name)
        expect(food6.name).to appear_before(food2.name)
        expect(food2.name).to appear_before(food1.name)
        expect(food1.name).to appear_before(food5.name)
    end

    it 'can show expiration date asc by clicking link' do
        food1 = Food.create(name: "Pork", category: "Meat", expiration_date: Date.new(2022, 12, 13), brand: "Porkey Industries", location: "Refridgerator")
        food2 = Food.create(name: "Broccoli", category: "Vegetable", expiration_date: Date.new(2022, 12, 12), brand: "Healthy Co", location: "Fridge")
        food3 = Food.create(name: "Ice Cream", category: "Dairy", expiration_date: Date.new(2023, 01, 01), brand: "Pillsbury", location: "Cabinet")
        food4 = Food.create(name: "Chips", category: "Snack", expiration_date: Date.new(2023, 04, 04), brand: "Namico", location: "Cabinet")

        visit '/'

        click_link "A-Z"
        
        expect(food2.name).to appear_before(food4.name)
        expect(food4.name).to appear_before(food3.name)
        expect(food3.name).to appear_before(food1.name)

        click_link "Date Sort"

        expect(food2.expiration_date).to appear_before(food1.expiration_date)
        expect(food1.expiration_date).to appear_before(food3.expiration_date)
        expect(food3.expiration_date).to appear_before(food4.expiration_date)
    end
end