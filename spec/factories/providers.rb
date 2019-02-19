FactoryBot.define do
  factory :provider do
    given_name { Faker::Ancient.god }
    surname { Faker::Superhero.name }
    street_address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Number.between(0, 49) }
    zip { Faker::Address.zip }
    phone { Faker::PhoneNumber.cell_phone }
    speciality { Faker::Number.between(0, 30) }
  end
end
