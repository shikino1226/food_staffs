FactoryBot.define do
  factory :food do
    content { "food test" }
    association :user
  end
end
