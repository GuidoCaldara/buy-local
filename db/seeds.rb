CATEGORIES = ["Insaccati", "Frutta", "Verdura", "Formaggi", "Conserve", "Erbe", "Carne", "Pesce", "Pasta Fresca"]

CATEGORIES.each do |c|
  Category.create(name: c)
end




ROADS = ["Via Roma", "Via Milano", "Via Torino", "Via Provinciale", "Via Lunga", "Via Mazzini", "Via Duca d'aosta"]

Merchant.create(email: "guido@merchant.com", password:"password", stripe_merchant_id: 'acct_1GRFpjGsjp9i5xvM')

Store.create(
  name: "Negozio Prova Guido",
  country: "Italy",
  street: "Via Mazzini",
  zip_code: "24021",
  city: "Albino",
  street_number: 93,
  state: "Bergamo",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nobis modi, deserunt cumque, molestiae necessitatibus repellat eius dolorem ipsum suscipit dolor ea ducimus quod eos beatae fugit tempora mollitia quis delectus?",
  phone_number: "04305866949",
  merchant: Merchant.first
)


8.times do
Merchant.create(email: Faker::Internet.email, password:"password", stripe_merchant_id: '')
end

i = 0
Merchant.all.each do |m|

  Store.create(
  name: "Negozio #{i + 1}",
  country: "Italy",
  street: ROADS[i],
  zip_code: "24021",
  city: "Albino",
  street_number: rand(20..50).to_s,
  state: "Bergamo",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae sit exercitationem",
  phone_number: "04305866949",
  merchant: m
)

end



Product.create(name:"Penne", price: 10, sold_by: "Unit", description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae sit exercitationem', store: Store.first, category: Category.all.sample)
Product.create(name:"Pesto", price: 5.4, sold_by: "Unit", description:  'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae sit exercitationem', store: Store.first, category: Category.all.sample)
Product.create(name:"Prosciutto", price: 5, sold_by: "100g", description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae sit exercitationem', store: Store.first, category: Category.all.sample)
Product.create(name:"Arrosto", price: 9, sold_by: "Kilo", description:  'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae sit exercitationem', store: Store.first, category: Category.all.sample)
Product.create(name:"Mele", price: 3, sold_by: "Kilo", description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae sit exercitationem', store: Store.first, category: Category.all.sample)
Product.create(name:"Pere", price: 2.4, sold_by: "Kilo", description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae sit exercitationem', store: Store.first, category: Category.all.sample)


40.times do
Product.create(name:Faker::Food.ingredient, price: rand(1..15), sold_by: ["Kilo", "Confezione", "100g"].sample, description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae sit exercitationem', store: Store.all[1..-1].sample, category: Category.all.sample)
end

