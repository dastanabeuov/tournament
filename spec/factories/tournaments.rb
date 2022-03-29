FactoryBot.define do
  factory :tournament do
    sequence(:name) { |n| "MyString#{n}" }
    date { '2022-06-06' }
    user { nil }    

    trait :invalid do
      name { nil }
    end
  end
end