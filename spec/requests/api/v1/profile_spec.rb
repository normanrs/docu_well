require 'rails_helper'

describe 'the profile endpoint' do
  xit 'returns content json from objects' do
    provider  = create(:provider)
    user      = create(:user)
    profile   = create(:profile, user_id: user.id, provider_id: provider.id )
    create(:insurance, profile_id: profile.id)
    create(:insurance, profile_id: profile.id)

    data = { api_key: user.api_key }
    get "/api/v1/profile", params: data

    expect(response.status).to eq 200
    data = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(data[:id]).not_to be_empty
    expect(data[:attributes]).not_to be_empty
    expect(data[:attributes].keys.include?(:given_name)).to be(true)
    expect(data[:attributes].keys.include?(:surname)).to be(true)
    expect(data[:attributes].keys.include?(:height)).to be(true)
    expect(data[:attributes].keys.include?(:dob)).to be(true)
    expect(data[:attributes].keys.include?(:weight)).to be(true)
    expect(data[:attributes].keys.include?(:bp_systolic)).to be(true)
    expect(data[:attributes].keys.include?(:bp_diastolic)).to be(true)
    expect(data[:attributes].keys.include?(:heart_rate)).to be(true)
    expect(data[:attributes].keys.include?(:blood_type)).to be(true)
    expect(data[:attributes].keys.include?(:provider)).to be(true)
    expect(data[:attributes].keys.include?(:insurances)).to be(true)
    expect(data[:attributes][:provider][:id]).to eq(provider.id)
    expect(data[:attributes][:insurances].count).to eq(2)
    expect(data[:attributes][:insurances][0].keys.include?(:id)).to be(true)
  end

  it 'deletes profile' do
    provider  = create(:provider)
    user      = create(:user)
    profile   = create(:profile, user_id: user.id, provider_id: provider.id)
    create(:insurance, profile_id: profile.id)
    create(:insurance, profile_id: profile.id)

    data = { api_key: user.api_key, profile_id: profile.id }
    delete "/api/v1/profile", params: data
    expect(response.status).to eq 200
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:message]).to eq("Profile deleted!")

  end
end
