require 'rails_helper'

describe 'the insurance endpoints' do
  it 'POST /insurances returns insurance content in json' do
    provider  = create(:provider)
    user      = create(:user)
    profile   = create(:profile, user_id: user.id, provider_id: provider.id )
    t.integer "insurance_type", limit: 2
    t.string "carrier"
    t.string "id_number"
    t.string "group_number"
    t.string "phone_number"
    t.bigint "profile_id"

    insurance_type = "medical"
    carrier = "Aetna"
    id_number = "abc123"
    group_number = "def456"
    phone_number = "800-111-1111"
    
    data = { api_key: user.api_key }
    get "/api/v1/profile", params: data
    expect(response.status).to eq 200
    data = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(data[0][:id]).not_to be_empty
    expect(data[0][:attributes]).not_to be_empty
    expect(data[0][:attributes].keys.include?(:given_name)).to be(true)
    expect(data[0][:attributes].keys.include?(:surname)).to be(true)
    expect(data[0][:attributes].keys.include?(:height)).to be(true)
    expect(data[0][:attributes].keys.include?(:dob)).to be(true)
    expect(data[0][:attributes].keys.include?(:weight)).to be(true)
    expect(data[0][:attributes].keys.include?(:bp_systolic)).to be(true)
    expect(data[0][:attributes].keys.include?(:bp_diastolic)).to be(true)
    expect(data[0][:attributes].keys.include?(:heart_rate)).to be(true)
    expect(data[0][:attributes].keys.include?(:blood_type)).to be(true)
    expect(data[0][:attributes].keys.include?(:provider)).to be(true)
    expect(data[0][:attributes].keys.include?(:insurances)).to be(true)
    expect(data[0][:attributes][:provider][:id]).to eq(provider.id)
    expect(data[0][:attributes][:insurances].count).to eq(2)
    expect(data[0][:attributes][:insurances][0].keys.include?(:id)).to be(true)
  end


end
