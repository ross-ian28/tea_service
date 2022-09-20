FactoryBot.define do
  factory :subscription do
    title { Faker::Subscription.plan }
    price { Faker::Number.within(range: 10..15) }
    status { "Active" }
    frequency { Faker::Subscription.payment_term }
  end
end
