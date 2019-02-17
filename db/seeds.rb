provider = FactoryBot.create(:provider)
profile_1 = FactoryBot.create(:profile, provider_id: provider.id)
profile_2 = FactoryBot.create(:profile, provider_id: provider.id)
profile_3 = FactoryBot.create(:profile, provider_id: provider.id)
profile_4 = FactoryBot.create(:profile, provider_id: provider.id)
profile_5 = FactoryBot.create(:profile, provider_id: provider.id)
FactoryBot.create(:insurance, profile_id: profile_1.id)
FactoryBot.create(:insurance, profile_id: profile_2.id)
FactoryBot.create(:insurance, profile_id: profile_3.id)
FactoryBot.create(:insurance, profile_id: profile_4.id)
FactoryBot.create(:insurance, profile_id: profile_5.id)

p 'Seeds created'
