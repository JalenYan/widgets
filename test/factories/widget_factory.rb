FactoryBot.define do
  factory :widget do
    name { Faker::Lorem.unique.word }
    price_cents { Faker::Number.within(range: 1..10_00000) }
    manufacturer
    widget_status
  end
end
