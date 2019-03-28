require 'rails_helper'

describe 'the profile endpoint' do
  it 'returns users profiles' do
    user      = create(:user)
    profile   = create(:profile, user_id: user.id )
    create(:insurance, profile_id: profile.id)
    create(:insurance, profile_id: profile.id)

    data = { api_key: user.api_key }
    get "/api/v1/profiles", params: data
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
    expect(data[0][:attributes].keys.include?(:insurances)).to be(true)
    expect(data[0][:attributes][:insurances].count).to eq(2)
    expect(data[0][:attributes][:insurances][0].keys.include?(:id)).to be(true)
  end

  it 'POST /profiles creates profile and returns profile content' do
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
             heart_rate: heart_rate, blood_type: blood_type, user_id: 0
           }

    post "/api/v1/profiles?api_key=#{user.api_key}", params: data
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
  end

  it 'will return error without api key' do
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
             heart_rate: heart_rate, blood_type: blood_type, user_id: 0
           }

    post "/api/v1/profiles", params: data
    expect(response.status).to eq 400
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:message]).not_to be_empty

  end

  it 'will return error without required info' do
    user      = create(:user)
    given_name = 'Louisa May'
    surname= 'Alcott'
    height= 60
    weight= 150
    bp_systolic= 120
    bp_diastolic= 80
    heart_rate= 100
    blood_type= 'o_negative'

    data = { given_name: given_name, surname: surname, height: height,
             weight: weight, bp_systolic: bp_systolic, bp_diastolic: bp_diastolic,
             heart_rate: heart_rate, blood_type: blood_type, user_id: 0
           }

    post "/api/v1/profiles?api_key=#{user.api_key}", params: data
    expect(response.status).to eq 400
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:message]).not_to be_empty

  end

  it 'deletes profile' do
    user      = create(:user)
    profile   = create(:profile, user_id: user.id)
    create(:insurance, profile_id: profile.id)
    create(:insurance, profile_id: profile.id)

    data = { api_key: user.api_key, profile_id: profile.id }
    delete "/api/v1/profiles", params: data
    expect(response.status).to eq 200
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:message]).to eq("Profile deleted!")
  end

  it 'PATCH /profiles edits a profile and returns profile content' do
    user      = create(:user)
    profile   = create(:profile, user_id: user.id)
    given_name = 'Louisa May'
    surname= 'Alcott'

    data = { profile_id: profile.id, given_name: given_name, surname: surname }

    patch "/api/v1/profiles?api_key=#{user.api_key}", params: data
    expect(response.status).to eq 200
    data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(data[:id].to_i).to eq(profile.id)
    expect(data[:attributes][:given_name]).to eq(given_name)
    expect(data[:attributes][:surname]).to eq(surname)
  end

  it 'PATCH /profiles does not edit profile w/o api key' do
    user      = create(:user)
    profile   = create(:profile, user_id: user.id)
    given_name = 'Louisa May'
    surname= 'Alcott'

    data = { profile_id: profile.id, given_name: given_name, surname: surname }

    patch "/api/v1/profiles", params: data
    expect(response.status).to eq 400
    message = JSON.parse(response.body)["message"]
    expect(data["message"]).to_not be_empty
  end
end
