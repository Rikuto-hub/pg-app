FactoryBot.define do
    factory :article do
      title { Faker::Lorem.characters(number: 10) }
      error { Faker::Lorem.characters(number: 50) }
      number { '1' }
    end
end