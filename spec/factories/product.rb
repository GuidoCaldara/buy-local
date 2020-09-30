FactoryBot.define do
  factory :product do
    store
    category
    package
    sequence(:name) { |n| "Product #{n}"}
    description { Faker::Lorem.words(number: rand(10..30)).join }
    sku  { Faker::Number.number(digits: 7) }
    price_cents {((rand(2...6) * 100) + rand(1..8) * 10)}
    trait :in_jar do
      association :package, factory: :jar
    end
  end
end

    # t.bigint "store_id", null: false
    # t.datetime "created_at", precision: 6, null: false
    # t.datetime "updated_at", precision: 6, null: false
    # t.integer "price_cents", default: 0, null: false
    # t.bigint "category_id", null: false
    # t.boolean "available", default: true
    # t.integer "discounted_price_cents", default: 0, null: false
    # t.integer "pack_weight"
    # t.bigint "package_id", null: false
