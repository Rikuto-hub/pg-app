FactoryBot.define do
    factory :user do
      email { Faker::Internet.email }
      password { 'password' }
      account_name {'test'}
    end
end