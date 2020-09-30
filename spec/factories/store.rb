STREETS = ["Mazzini", "Roma", "Milano", "Lunga", "Provinciale", "Trieste", "Parri"]

FactoryBot.define do
  factory :store, class: Store do
    merchant
    sequence(:name) { |n| "Store Test #{n}"}
    zip_code { '24021' }
    city { 'Albino'}
    state { 'Bergamo'}
    country {'Italy'}
    street  { "via #{STREETS.sample}" }
    street_number { rand(1..30)}
    description {'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Recusandae voluptates, accusamus repellendus commodi repudiandae et ipsum vero veniam quos id. Omnis magni rem esse dicta alias quidem, numquam perferendis impedit.'}
    phone_number { (0..8).map { rand(1..9) }.join }
    delivery_fee_cents { rand(3..5) * 100 }
    free_delivery_threshold_cents { [0, (rand(6..9) * 100)].sample }
    delivery_time { rand(1..4) * 24 }
    trait :with_products do
      after(:create) do |store, evaluator|
        create(:product, store: store)
        create(:product, store: store)
        create(:product, store: store)
        create(:product, store: store)
      end
    end
  end
end
