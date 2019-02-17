require 'rails_helper'

describe 'the profile endpoint' do
  it 'GET /profile returns profile content in json' do
    provider  = create(:provider)
    user      = create(:user)
    profile   = create(:profile, user_id: user.id, provider_id: provider.id )
    create(:insurance, profile_id: profile.id)
    create(:insurance, profile_id: profile.id)

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

  it 'POST /profile creates profile and returns profile content in json' do
    provider  = create(:provider)
    user      = create(:user)
    given_name = 'Louisa May'
    surname= 'Alcott'
    dob= "2015-12-08"
    height= 60
    weight= 150
    bp_systolic= 120
    bp_diastolic= 80
    heart_rate= 100
    blood_type= 'o_negative'

    data = { given_name: given_name, surname: surname, dob: dob, height: height,
             weight: weight, bp_systolic: bp_systolic, bp_diastolic: bp_diastolic,
             heart_rate: heart_rate, blood_type: blood_type, user_id: 0,
             provider_id: provider.id }

    post "/api/v1/profile?api_key=#{user.api_key}", params: data

    expect(response.status).to eq 201
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
    expect(data[:attributes][:insurances].count).to eq(0)
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

  it 'will return error without api key' do
    provider  = create(:provider)
    user      = create(:user)
    given_name = 'Louisa May'
    surname= 'Alcott'
    dob= "2015-12-08"
    height= 60
    weight= 150
    bp_systolic= 120
    bp_diastolic= 80
    heart_rate= 100
    blood_type= 'o_negative'

    data = { given_name: given_name, surname: surname, dob: dob, height: height,
             weight: weight, bp_systolic: bp_systolic, bp_diastolic: bp_diastolic,
             heart_rate: heart_rate, blood_type: blood_type, user_id: 0,
             provider_id: provider.id }

    post "/api/v1/profile", params: data

    expect(response.status).to eq 422
  end
end
