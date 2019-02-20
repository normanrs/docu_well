FactoryBot.define do
  factory :prescription do
    name { Faker::Ancient.titan }
    date {(rand(Time.now.to_i..(Time.now + 31557600).to_i))}
    dose { rand(1..100) }
    dose_units { rand(0..82) }
    directions { "Taken orally or anally" }
    refill { [true, false].sample }
    association :profile, factory: :profile
    association :provider, factory: :provider
  end
end
