FactoryBot.define do
  factory :recipe_process do
    step { "じゃがいもは洗ったら皮のままレンジで６００wで３分チン" }
    association :recipe
  end
end
