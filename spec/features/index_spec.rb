require 'rails_helper'

RSpec.describe "Index page" do
    it "displays storage containters with food items listed" do
        cabinet = Cabinet.new
        fridge = Refridgerator.new
        freezer = Freezer.new
        random = Miscellaneous.new
        food1 = Food.new(name: "Pork", category: "Meat", expiration_date: "30 December 2022", refridgerator_id: 1)
        food2 = Food.new(name: "Broccoli", category: "Vegetable", expiration_date: "5 December 2022", cabinet_id: 1)
        food3 = Food.new(name: "Ice Cream", category: "Dairy", expiration_date: "5 December 2022", freezer_id: 1)
        food4 = Food.new(name: "Chips", category: "Snack", expiration_date: "1 January 2023", miscellaneous_id: 1)
        
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
end