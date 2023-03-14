require 'rails_helper'

RSpec.describe Food, type: :model do
    describe "Validations" do
        it { should validate_presence_of :name }
        it { should validate_presence_of :category }
    end

    describe 'methods' do
        it 'can sort expirations dates from oldest to newest' do
            food1 = Food.create(name: "Pork", category: "Meat", expiration_date: Date.new(2022, 12, 13), brand: "Porkey Industries", location: "Refridgerator")
            food2 = Food.create(name: "Broccoli", category: "Vegetable", expiration_date: Date.new(2022, 12, 12), brand: "Healthy Co", location: "Fridge")
            food3 = Food.create(name: "Ice Cream", category: "Dairy", expiration_date: Date.new(2023, 01, 01), brand: "Pillsbury", location: "Cabinet")
            food4 = Food.create(name: "Chips", category: "Snack", expiration_date: Date.new(2023, 04, 04), brand: "Namico", location: "Cabinet")

            expect(Food.oldest_to_newest).to eq([food2, food1, food3, food4])
        
        end

        it 'can sort food name alphabetically asc' do
            food1 = Food.create(name: "Pork", category: "Meat", expiration_date: Date.new(2022, 12, 13), brand: "Porkey Industries", location: "Refridgerator")
            food2 = Food.create(name: "Broccoli", category: "Vegetable", expiration_date: Date.new(2022, 12, 12), brand: "Healthy Co", location: "Fridge")
            food3 = Food.create(name: "Ice Cream", category: "Dairy", expiration_date: Date.new(2023, 01, 01), brand: "Pillsbury", location: "Cabinet")
            food4 = Food.create(name: "Chips", category: "Snack", expiration_date: Date.new(2023, 04, 04), brand: "Namico", location: "Cabinet")
            
            expect(Food.alphabetically_asc).to eq([food2, food4, food3, food1])
        end

        it 'can sort food by category alphabetically' do
            food1 = Food.create(name: "Pork", category: "Meat", expiration_date: Date.new(2022, 12, 13), brand: "Porkey Industries", location: "Refridgerator")
            food2 = Food.create(name: "Chicken", category: "Meat", expiration_date: Date.new(2022, 12, 12), brand: "Healthy Co", location: "Fridge")
            food3 = Food.create(name: "Ice Cream", category: "Dairy", expiration_date: Date.new(2023, 01, 01), brand: "Pillsbury", location: "Cabinet")
            food4 = Food.create(name: "Eggs", category: "Dairy", expiration_date: Date.new(2023, 04, 04), brand: "Namico", location: "Cabinet")
            food5 = Food.create(name: "Broccoli", category: "Vegetable", expiration_date: Date.new(2022, 01, 04), brand: "Namico", location: "Cabinet")
            food6 = Food.create(name: "Pomegranate", category: "Fruit", expiration_date: Date.new(2022, 12, 17), brand: "Namico", location: "Cabinet")
            
            expect(Food.category_asc).to eq([food4, food3, food6, food2, food1, food5])
        end 

        xit 'can sort food by expiration date asc' do
            food1 = Food.create(name: "Pork", category: "Meat", expiration_date: Date.new(2022, 12, 13), brand: "Porkey Industries", location: "Refridgerator")
            food2 = Food.create(name: "Chicken", category: "Meat", expiration_date: Date.new(2022, 12, 12), brand: "Healthy Co", location: "Fridge")
            food3 = Food.create(name: "Ice Cream", category: "Dairy", expiration_date: Date.new(2023, 01, 01), brand: "Pillsbury", location: "Cabinet")
            food4 = Food.create(name: "Eggs", category: "Dairy", expiration_date: Date.new(2023, 04, 04), brand: "Namico", location: "Cabinet")
            food5 = Food.create(name: "Broccoli", category: "Vegetable", expiration_date: Date.new(2022, 01, 04), brand: "Namico", location: "Cabinet")
            food6 = Food.create(name: "Pomegranate", category: "Fruit", expiration_date: Date.new(2022, 12, 17), brand: "Namico", location: "Cabinet")
            
            expect(Food.expiration_asc).to eq([food5, food2, food1, food6, food3, food4])
        end 
    end
end