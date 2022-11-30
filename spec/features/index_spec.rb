require 'rails_helper'

RSpec.describe "Index page" do
    it "displays storage containters with food items listed" do
        food1 = Food.create(name: "Pork", category: "Meat", expiration_date: "30 December 2022")
        food2 = Food.create(name: "Broccoli", category: "Vegetable", expiration_date: "5 December 2022")
        food3 = Food.create(name: "Ice Cream", category: "Dairy", expiration_date: "5 December 2022")
        food4 = Food.create(name: "Chips", category: "Snack", expiration_date: "1 January 2023")
        cabinet = Cabinet.create(food_id: food2.id)
        fridge = Refridgerator.create(food_id: food1.id)
        freezer = Freezer.create(food_id: food3.id)
        other = Other.create(food_id: food4.id)
        
        visit "/"

        expect(page).to have_content("Fridge")
        expect(page).to have_content("Freezer")
        expect(page).to have_content("Cabinet")
        expect(page).to have_content("Other")

        within '#Fridge' do
            expect(page).to have_content("Pork")
            expect(page).to have_content("Meat")
            expect(page).to have_content("30 December 2022")
            expect(page).to_not have_content("Ice Cream")
            expect(page).to_not have_content("Vegetable")
            expect(page).to_not have_content("1 January 2023")
        end
        
        within '#Freezer' do
            expect(page).to have_content("Ice Cream")
            expect(page).to have_content("Dairy")
            expect(page).to have_content("5 December 2022")
            expect(page).to_not have_content("Pork")
            expect(page).to_not have_content("Meat")
            expect(page).to_not have_content("Broccoli")
        end

        within '#Cabinet' do
            expect(page).to have_content("Broccoli")
            expect(page).to have_content("Vegetable")
            expect(page).to have_content("5 December 2022")
            expect(page).to_not have_content("Dairy")
            expect(page).to_not have_content("Chips")
            expect(page).to_not have_content("30 December 2022")
        end
        
        within '#Other' do
            expect(page).to have_content("Chips")
            expect(page).to have_content("Snack")
            expect(page).to have_content("1 January 2023")
            expect(page).to_not have_content("30 December 2022")
            expect(page).to_not have_content("Pork")
            expect(page).to_not have_content("Dairy")
            expect(page).to_not have_content("5 December 2022")
        end
    end

    it "has clickable links that takes you to that items show page" do
        food1 = Food.create(name: "Pork", category: "Meat", expiration_date: "30 December 2022")
        fridge = Refridgerator.create(food_id: food1.id)
        
        visit "/"

        expect(page).to have_link("Fridge")
        click_link("Fridge")
        expect(current_path).to eq fridge_path(fridge.id)
        
    end
end