FactoryBot.define do
  factory :cart_product do
    factory :cart_produtct_pasta do
      pasta
      not_completed_cart
      quantity {3}
    end
  end
end
