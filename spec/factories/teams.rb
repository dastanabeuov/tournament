FactoryBot.define do
  factory :team do
    name { "MyString" }
    user { nil }
    tournament { nil }

    trait :invalid do
      name { nil }
    end
  end
end
