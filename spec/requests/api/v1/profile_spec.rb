require 'rails_helper'

describe 'the profile endpoint' do
  it 'returns content json from objects' do
    provider = create(:provider)
    user     = create(:user)
    profile  = create(:profile, user_id: user.id)

    data = { api_key: user.api_key }
    get "/api/v1/profile", params: data

    expect(response.status).to eq 200
    result = JSON.parse(response.body, symbolize_names: true)
    expect(result[:data][:id]).not_to be_empty
    expect(result[:data][:attributes]).not_to be_empty
    expect(result[:data][:attributes].keys.include?(:given_name)).to be(true)
    expect(result[:data][:attributes].keys.include?(:surname)).to be(true)
    expect(result[:data][:attributes].keys.include?(:height)).to be(true)
    expect(result[:data][:attributes].keys.include?(:dob)).to be(true)
    expect(result[:data][:attributes].keys.include?(:weight)).to be(true)
    expect(result[:data][:attributes].keys.include?(:bp_systolic)).to be(true)
    expect(result[:data][:attributes].keys.include?(:bp_diastolic)).to be(true)
    expect(result[:data][:attributes].keys.include?(:heart_rate)).to be(true)
    expect(result[:data][:attributes].keys.include?(:blood_type)).to be(true)
    expect(result[:data][:attributes].keys.include?(:provider)).to be(true)
    expect(result[:data][:attributes][:provider][:id]).to eq(provider.id)
  end
end
