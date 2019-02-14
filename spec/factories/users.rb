FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Appliance.brand }
  end
end
