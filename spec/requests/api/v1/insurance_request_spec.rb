require 'rails_helper'

describe 'the insurance endpoints' do
  it 'POST /insurances returns insurance content in json' do
    provider  = create(:provider)
    user      = create(:user)
    profile   = create(:profile, user_id: user.id, provider_id: provider.id )

    insurance_type = "medical"
    carrier = "Aetna"
    id_number = "abc123"
    group_number = "def456"
    phone_number = "800-111-1111"

    data = {insurance_type: insurance_type,
            carrier: carrier,
            id_number: id_number,
            group_number: group_number,
            phone_number: phone_number,
            profile_id: profile.id}

    post "/api/v1/insurances?api_key=#{user.api_key}", params: data

    expect(response.status).to eq 201
    data = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(data[:id]).not_to be_empty
    expect(data[:attributes]).not_to be_empty
    expect(data[:attributes].keys.include?(:insurance_type)).to be(true)
    expect(data[:attributes].keys.include?(:carrier)).to be(true)
    expect(data[:attributes].keys.include?(:id_number)).to be(true)
    expect(data[:attributes].keys.include?(:group_number)).to be(true)
    expect(data[:attributes].keys.include?(:phone_number)).to be(true)
    expect(data[:attributes].keys.include?(:profile_id)).to be(true)
  end

  it 'POST /insurances returns error w/o api key' do
    provider  = create(:provider)
    user      = create(:user)
    profile   = create(:profile, user_id: user.id, provider_id: provider.id )

    insurance_type = "medical"
    carrier = "Aetna"
    id_number = "abc123"
    group_number = "def456"
    phone_number = "800-111-1111"

    data = {insurance_type: insurance_type,
            carrier: carrier,
            id_number: id_number,
            group_number: group_number,
            phone_number: phone_number,
            profile_id: profile.id}

    post "/api/v1/insurances", params: data

    expect(response.status).to eq 400
    data = JSON.parse(response.body)
    expect(data["message"]).to eq("undefined method `id' for nil:NilClass")
  end

  it 'POST /insurances wont create insurance if user and profile dont correspond' do
    provider   = create(:provider)
    user       = create(:user)
    user1      = create(:user)
    profile    = create(:profile, user_id: user.id, provider_id: provider.id )

    post "/api/v1/insurances?api_key=#{user1.api_key}", params: {profile_id: profile.id}

    expect(response.status).to eq 400
    data = JSON.parse(response.body)
    expect(data["message"]).to eq("Bad API key")
  end

  it 'GET /insurances returns all insurance objects in json' do
    provider  = create(:provider)
    user      = create(:user)
    profile   = create(:profile, user_id: user.id, provider_id: provider.id )
    create(:insurance, profile_id: profile.id)
    create(:insurance, profile_id: profile.id)

    get "/api/v1/insurances?api_key=#{user.api_key}", params: {profile_id: profile.id}

    expect(response.status).to eq 200
    data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(data[0][:id]).not_to be_empty
    expect(data[0][:attributes].keys.include?(:insurance_type)).to be(true)
    expect(data[0][:attributes].keys.include?(:carrier)).to be(true)
    expect(data[0][:attributes].keys.include?(:id_number)).to be(true)
    expect(data[0][:attributes].keys.include?(:group_number)).to be(true)
    expect(data[0][:attributes].keys.include?(:phone_number)).to be(true)
    expect(data[0][:attributes].keys.include?(:profile_id)).to be(true)
    expect(data[1][:id]).not_to be_empty
    expect(data[1][:attributes].keys.include?(:insurance_type)).to be(true)
    expect(data[1][:attributes].keys.include?(:carrier)).to be(true)
    expect(data[1][:attributes].keys.include?(:id_number)).to be(true)
    expect(data[1][:attributes].keys.include?(:group_number)).to be(true)
    expect(data[1][:attributes].keys.include?(:phone_number)).to be(true)
    expect(data[1][:attributes].keys.include?(:profile_id)).to be(true)
  end

  it 'GET /insurances wont return insurance objects w/o api key' do
    provider  = create(:provider)
    user      = create(:user)
    profile   = create(:profile, user_id: user.id, provider_id: provider.id )
    create(:insurance, profile_id: profile.id)
    create(:insurance, profile_id: profile.id)

    get "/api/v1/insurances", params: {profile_id: profile.id}

    expect(response.status).to eq 400
    data = JSON.parse(response.body)
    expect(data["message"]).to eq("undefined method `id' for nil:NilClass")
  end
end
