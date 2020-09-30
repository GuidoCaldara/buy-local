FactoryBot.define do
  factory :merchant do
    sequence(:email) { |n| "merchant#{n}@test.com"}
    password {"password"}
    trait :with_store do
      after(:create) do |merchant, evaluator|
        create(:store, merchant: merchant)
      end
    end
  end
end



