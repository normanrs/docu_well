FactoryBot.define do
  factory :profile do
    given_name { Faker::Name.name }
    surname { Faker::GreekPhilosophers.name }
    dob { Faker::Date.birthday(5,75) }
    height { Faker::Number.between(48, 96) }
    weight { Faker::Number.between(5, 300) }
    bp_systolic { Faker::Number.between(70, 160) }
    bp_diastolic { Faker::Number.between(40, 130) }
    heart_rate { Faker::Number.between(30, 200) }
    blood_type { Faker::Number.between(0, 7) }
    provider_id { 1 }
    user_id { 1 }
  end
end
