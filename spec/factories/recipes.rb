FactoryBot.define do
  factory :recipe do
    name { "ポテトスープ" }
    association :user
  end
end
