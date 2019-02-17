FactoryBot.define do
  factory :appointment do
    datetime { Faker::Time.between(Date.today, 200.days.from_now) }
    # provider_id { 1 }
    association :profile, factory: :profile
    association :provider, factory: :provider
  end
end
