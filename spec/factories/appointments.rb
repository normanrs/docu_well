FactoryBot.define do
  factory :appointment do
    datetime {(rand(Time.now.to_i..(Time.now + 31557600).to_i))}
    association :profile, factory: :profile
    association :provider, factory: :provider
  end
end
