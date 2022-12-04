require 'rails_helper'

RSpec.describe "Delete Method" do
    it 'can delete an exisiting food and give the user a succussful message' do
        food1 = Food.create(name: "Pork", category: "Meat", expiration_date: "30 December 2022")
        food2 = Food.create(name: "Broccoli", category: "Vegetable", expiration_date: "5 December 2022")

        visit root_path

        expect(page).to have_content(food1.name)
        expect(page).to have_content(food1.category)
        expect(page).to have_content(food1.expiration_date)
        expect(page).to have_content(food2.name)
        expect(page).to have_content(food2.category)
        expect(page).to have_content(food2.expiration_date)
        expect(page).to have_link "Delete #{food1.name}"

        click_link "Delete #{food1.name}"

        expect(page).to_not have_content(food1.name)
        expect(page).to_not have_content(food1.category)
        expect(page).to_not have_content(food1.expiration_date)
        expect(page).to have_content(food2.name)
        expect(page).to have_content(food2.category)
        expect(page).to have_content(food2.expiration_date)
    end
end