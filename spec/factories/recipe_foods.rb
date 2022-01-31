FactoryBot.define do
  factory :recipe_food do
    contents { "じゃがいも" }
    quantity { "1個" }
    association :recipe
  end
end
