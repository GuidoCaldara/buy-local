CATEGORIES = ["Insaccati", "Frutta", "Verdura", "Formaggi", "Conserve", "Erbe", "Carne", "Pesce"]

CATEGORIES.each do |c|
  Category.create(name: c)
end
Shop.create(email: "test@test.com", password:"password", stripe_user_id: 'acct_1GRFpjGsjp9i5xvM')
Store.create(
  name: "Bottega",
  country: "Italy",
  street: "Via Mazzini",
  zip_code: "24021",
  city: "Albino",
  state: "Bergamo",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae sit exercitationem",
  phone_number: "04305866949",
  shop: Shop.first
)



Product.create(name:"Penne", price: 10, sold_by: "Unit", description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae sit exercitationem', store: Store.first, category: Category.all.sample)
Product.create(name:"Pesto", price: 5.4, sold_by: "Unit", description:  'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae sit exercitationem', store: Store.first, category: Category.all.sample)
Product.create(name:"Prosciutto", price: 5, sold_by: "100g", description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae sit exercitationem', store: Store.first, category: Category.all.sample)
Product.create(name:"Arrosto", price: 9, sold_by: "Kilo", description:  'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae sit exercitationem', store: Store.first, category: Category.all.sample)
Product.create(name:"Mele", price: 3, sold_by: "Kilo", description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae sit exercitationem', store: Store.first, category: Category.all.sample)
Product.create(name:"Pere", price: 2.4, sold_by: "Kilo", description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae sit exercitationem', store: Store.first, category: Category.all.sample)
