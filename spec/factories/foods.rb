FactoryBot.define do
  factory :food do
    name { "牛乳" }
    expiry_date { "2022-12-12" }
    association :user
  end
end
