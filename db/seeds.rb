# require 'open-uri'
# require 'json'

# CATEGORIES = ["Insaccati", "Frutta", "Verdura", "Formaggi", "Conserve", "Erbe", "Carne", "Pesce", "Pasta Fresca"]
# PACKAGES = ["box", "jar", "kg", "hg", "g", "piece"]
# ROADS = ["Via Roma", "Via Milano", "Via Torino", "Via Provinciale", "Via Lunga", "Via Mazzini", "Via Duca d'aosta"]

# puts "creating first Merchant"
# Merchant.create(email: "guido@merchant.com", password:"password", stripe_merchant_id: 'acct_1GRFpjGsjp9i5xvM')

# puts "Creating Packages Type"
# PACKAGES.each do |p|
#   Package.create(name: p)
# end

# puts "Creating Categories"
# CATEGORIES.each do |c|
#   Category.create(name: c)
# end

# puts "Creating Main Store"
# Store.create(
#   name: "Negozio Prova Guido",
#   country: "Italy",
#   street: "Via Mazzini",
#   zip_code: "24021",
#   city: "Albino",
#   street_number: 93,
#   state: "Bergamo",
#   description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nobis modi, deserunt cumque, molestiae necessitatibus repellat eius dolorem ipsum suscipit dolor ea ducimus quod eos beatae fugit tempora mollitia quis delectus?",
#   phone_number: "04305866949",
#   merchant: Merchant.first
# )


# puts "Creating 8 stores"
# 8.times do
# Merchant.create(email: Faker::Internet.email, password:"password", stripe_merchant_id: 'acct_1GRFpjGsjp9i5xvM' )
# end

# i = 0
# Merchant.all.each do |m|
#   Store.create(
#   name: "Negozio #{i + 1}",
#   country: "Italy",
#   street: ROADS[i],
#   zip_code: "24021",
#   city: "Albino",
#   street_number: rand(20..50).to_s,
#   state: "Bergamo",
#   description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae sit exercitationem",
#   phone_number: "04305866949",
#   merchant: m
# )
# i += 1
# end


# puts "creating products"
# 70.times do
#   product = Product.new(
#     package: Package.all.sample,
#     price: rand(1..15),
#     description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae sit exercitationem',
#     store: Store.all.sample,
#     category: Category.all.sample
#     )
#   datas = nil
#   loop do
#     name = Faker::Food.ingredient
#     puts "Getting picture for " + name
#     url = "https://pixabay.com/api/?key=#{ENV['PIXABAY_API_KEY']}&q=#{name}&image_type=photo"

#     results = JSON.parse(open(url).read)
#     datas = results["hits"]
#     product.name = name
#     break if results["hits"].any?
#   end

#   file = URI.open(datas.sample["webformatURL"])
#   puts "File is"
#   product.photo.attach(io: file, filename: product.name, content_type: 'image/png')
#   product.save
# end

20.times do
  cart = Cart.create(user: User.all.sample, store_id: 2, completed: true)
  rand(1..4).times do
    CartProduct.create(
      cart: cart,
      product: cart.store.products.sample,
      quantity: rand(1..4),
    )
  end
end

Cart.all.each do |cart|
  Order.create(
      cart: cart,
      status: ['paid', 'pending', 'delivered'].sample
    )
end


