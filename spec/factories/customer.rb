FactoryBot.define do
  factory :customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { "#{Faker::Games::Overwatch.hero}@overwatch.com" }
    address { Faker::Address.full_address }
  end
end
