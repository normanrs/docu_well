require 'rails_helper'
describe 'the profile endpoint' do
  it 'returns users appointments by profile' do
    provider  = create(:provider)
    user      = create(:user)
    profile   = create(:profile, user_id: user.id, provider_id: provider.id )
    create(:insurance, profile_id: profile.id)
    create(:appointment, profile_id: profile.id)
    create(:appointment, profile_id: profile.id)

    data = { api_key: user.api_key, profile_id: profile.id }
    get "/api/v1/appointments", params: data

    expect(response.status).to eq 200
    data = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(data[0][:id]).not_to be_empty
    expect(data[0][:attributes]).not_to be_empty
    expect(data[0][:attributes].keys.include?(:datetime)).to be(true)
    expect(data[0][:attributes].keys.include?(:provider_id)).to be(true)
    expect(data[0][:attributes].keys.include?(:profile_id)).to be(true)
  end

  it 'POST /appointments creates appointment and returns appointment content in json' do
    provider  = create(:provider)
    user      = create(:user)
    profile   = create(:profile, user_id: user.id, provider_id: provider.id )
    create(:insurance, profile_id: profile.id)
    data = { api_key: user.api_key,
             datetime: 1550453488,
             profile_id: profile.id,
             provider_id: provider.id
    }

    post "/api/v1/appointments", params: data

    expect(response.status).to eq 201
    data = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(data[:id]).not_to be_empty
    expect(data[:attributes]).not_to be_empty
    expect(data[:attributes].keys.include?(:datetime)).to be(true)
    expect(data[:attributes].keys.include?(:provider_id)).to be(true)
    expect(data[:attributes].keys.include?(:profile_id)).to be(true)
  end

  it 'POST /appointments doesnt create appointment using bad API key' do
    provider  = create(:provider)
    user      = create(:user)
    profile   = create(:profile, user_id: user.id, provider_id: provider.id )
    create(:insurance, profile_id: profile.id)
    data = { api_key: "hahahaha",
             datetime: 1550453488,
             profile_id: profile.id,
             provider_id: provider.id
    }

    post "/api/v1/appointments", params: data

    expect(response.status).to eq 400
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:message]).not_to be_empty
  end

  it 'POST /appointments doesnt create appointment without required info' do
    provider  = create(:provider)
    user      = create(:user)
    profile   = create(:profile, user_id: user.id, provider_id: provider.id )
    create(:insurance, profile_id: profile.id)
    data = { api_key: user.api_key,
             profile_id: profile.id,
             provider_id: provider.id
    }

    post "/api/v1/appointments", params: data

    expect(response.status).to eq 400
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:message]).not_to be_empty
  end

  it 'deletes an appointment' do
    provider  = create(:provider)
    user      = create(:user)
    profile   = create(:profile, user_id: user.id, provider_id: provider.id )
    create(:insurance, profile_id: profile.id)
    appt = create(:appointment, profile_id: profile.id)

    data = { api_key: user.api_key, profile_id: profile.id, appointment_id: appt.id }
    delete "/api/v1/appointments", params: data
    expect(response.status).to eq 200
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:message]).to eq("Appointment deleted!")
  end

  it 'does not delete an appointment with bad api key' do
    provider  = create(:provider)
    user      = create(:user)
    profile   = create(:profile, user_id: user.id, provider_id: provider.id )
    create(:insurance, profile_id: profile.id)
    appt = create(:appointment, profile_id: profile.id)

    data = { api_key: 'hahahaha', profile_id: profile.id, appointment_id: appt.id }
    delete "/api/v1/appointments", params: data
    expect(response.status).to eq 400
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:message]).not_to be_empty
  end

end
