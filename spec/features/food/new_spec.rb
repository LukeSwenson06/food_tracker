require 'rails_helper'

RSpec.describe "New Page" do
    it "can fill out a form and submit it" do

        visit "/food/new"

        expect(current_path).to eq("/food/new")
        expect(page).to have_content("Foods Name")
        expect(page).to have_content("Select Category")
        expect(page).to have_content("Select Food's Expiratio  Date")
        fill_in "Foods Name", with: 'Doritos'
        fill_in "Select Category", with: 'Snack'
        fill_in "Select Food's Expiration Date", with: '12-05-2022'
        click_button "Submit"
        
        expect(current_path).to eq("/")
        expect(page).to have_content("Your New Food has been Added!")
    end
end