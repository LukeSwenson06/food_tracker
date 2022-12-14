Food.destroy_all

pork = Food.create(name: "Pork", category: "Meat", expiration_date: Date.new(2022, 12, 13), brand: "Porkey Industries", location: "Refridgerator")
chicken = Food.create(name: "Chicken", category: "Meat", expiration_date: Date.new(2022, 12, 12), brand: "Healthy Co", location: "Fridge")
ice_cream = Food.create(name: "Ice Cream", category: "Dairy", expiration_date: Date.new(2023, 01, 01), brand: "Pillsbury", location: "Cabinet")
eggs = Food.create(name: "Eggs", category: "Dairy", expiration_date: Date.new(2023, 04, 04), brand: "Namico", location: "Cabinet")
broccoli = Food.create(name: "Broccoli", category: "Vegetable", expiration_date: Date.new(2022, 01, 04), brand: "Namico", location: "Cabinet")
pomegranate = Food.create(name: "Pomegranate", category: "Fruit", expiration_date: Date.new(2022, 12, 17), brand: "Namico", location: "Cabinet")