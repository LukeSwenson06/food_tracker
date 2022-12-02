require 'rails_helper'

RSpec.describe 'Edit Page' do
    it 'can edit the information' do
        food1 = Food.create(name: "Pork", category: "Meat", expiration_date: "30 December 2022")
        
        visit root_path
        
        expect(page).to_not have_content("Spaghetti")
        expect(page).to have_link("Edit #{food1.name}")
        click_link "Edit #{food1.name}"
        
        expect(page).to have_content("Foods Name")
        expect(page).to have_content("Type Category of Food")
        expect(page).to have_content("Select Food's Expiration Date")
        
        fill_in "Foods Name", with: 'Spaghetti'
        fill_in "Type Category of Food", with: "#{food1.category}"
        fill_in "Select Food's Expiration Date", with: "#{food1.expiration_date}"
        click_button "Submit"
        
        expect(current_path).to eq(root_path)
        expect(page).to have_content("Spaghetti")
        expect(page).to have_content("Your Edit has been Successful!")
    end
    
    it "will produce an error message when information has not been filled out" do
        food1 = Food.create(name: "Pork", category: "Meat", expiration_date: "30 December 2022")
        
        visit edit_food_path(food1.id)
        
        fill_in "Foods Name", with: "Spaghetti"
        fill_in "Type Category of Food", with: ""
        fill_in "Select Food's Expiration Date", with: "#{food1.expiration_date}"
        click_button "Submit"

        expect(current_path).to eq edit_food_path(food1.id)
        expect(page).to have_content("Please fill out all fields")
    end
end