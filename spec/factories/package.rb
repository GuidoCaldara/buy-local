FactoryBot.define do
  factory :package do
    name { "kg" }
    factory :box do
      name { "box" }
    end
    factory :jar do
      name { "jar" }
    end
    factory :kg do
      name { "kg" }
    end
    factory :hg do
      name { "hg" }
    end
    factory :g do
      name { "g" }
    end
    factory :piece do
      name { "piece" }
    end
  end
end

