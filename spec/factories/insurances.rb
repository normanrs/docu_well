FactoryBot.define do
  factory :insurance do
    insurance_type { Faker::Number.between(0, 3) }
    carrier { Faker::Superhero.name }
    id_number { Faker::Color.hex_color }
    group_number { Faker::Color.hex_color }
    phone_number { Faker::PhoneNumber.phone_number }
    association :profile, factory: :profile

  end
end
