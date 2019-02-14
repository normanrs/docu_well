FactoryBot.define do
  factory :provider do
    first_name { Faker::Ancient.god }
    last_name { Faker::Superhero.name }
    street_address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Number.between(0, 49) }
    zip { Faker::Address.zip }
    phone { Faker::PhoneNumber.cell_phone }
  end
end
