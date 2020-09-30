FactoryBot.define do
  factory :cart do
    user
    store { Store.first || :store}
    # factory :not_completed_cart, class: Cart do
    #   association :user, factory: :user, strategy: :build
    #   association :store, factory: :store_a
    #   completed {false}
    # end
    # factory :completed_cart, class: Cart  do
    #   association :user, factory: :user, strategy: :build
    #   association :store, factory: :store_a
    #   completed {true}
    # end
  end
end
