FactoryBot.define do
  factory :subscription do
    title { Faker::Science.element }
    price { Faker::Number.within(range: 10..15) }
    status { "Active" }
    frequency { "Once a month" }
  end
end
