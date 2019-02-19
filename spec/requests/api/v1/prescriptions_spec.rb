require 'rails_helper'
describe 'the prescriptions endpoint' do
  it 'returns prescriptions by profile' do
    provider  = create(:provider)
    user      = create(:user)
    profile   = create(:profile, user_id: user.id, provider_id: provider.id)
    create(:prescription, profile_id: profile.id, provider_id: provider.id)
    create(:prescription, profile_id: profile.id, provider_id: provider.id)

    data = { api_key: user.api_key, profile_id: profile.id }
    get "/api/v1/prescriptions", params: data

    expect(response.status).to eq 200
    data = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(data[0][:id]).not_to be_empty
    expect(data[0][:attributes]).not_to be_empty
    expect(data[0][:attributes].keys.include?(:name)).to be(true)
    expect(data[0][:attributes].keys.include?(:date)).to be(true)
    expect(data[0][:attributes].keys.include?(:dose)).to be(true)
    expect(data[0][:attributes].keys.include?(:directions)).to be(true)
    expect(data[0][:attributes].keys.include?(:refill)).to be(true)
    expect(data[0][:attributes].keys.include?(:provider)).to be(true)
  end

  it 'POST /prescriptions creates prescription and returns prescription content in json' do
    provider  = create(:provider)
    user      = create(:user)
    profile   = create(:profile, user_id: user.id, provider_id: provider.id )
    create(:insurance, profile_id: profile.id)
    data = { api_key: user.api_key,
             profile_id: profile.id,
             provider_id: provider.id,
             name: 'Selexipro',
             date: 1550453488,
             dose: 12,
             dose_units: 6,
             directions: "Taken topically or subtropically",
             refill: true,

    }

    post "/api/v1/prescriptions", params: data

    expect(response.status).to eq 201
    data = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(data[:id]).not_to be_empty
    expect(data[:attributes]).not_to be_empty
    expect(data[:attributes].keys.include?(:name)).to be(true)
    expect(data[:attributes].keys.include?(:date)).to be(true)
    expect(data[:attributes].keys.include?(:dose)).to be(true)
    expect(data[:attributes].keys.include?(:directions)).to be(true)
    expect(data[:attributes].keys.include?(:refill)).to be(true)
    expect(data[:attributes].keys.include?(:provider)).to be(true)
  end

  xit 'POST /prescriptions doesnt create prescription using bad API key' do
    provider  = create(:provider)
    user      = create(:user)
    profile   = create(:profile, user_id: user.id, provider_id: provider.id )
    create(:insurance, profile_id: profile.id)
    data = { api_key: "hahahaha",
             datetime: 1550453488,
             profile_id: profile.id,
             provider_id: provider.id
    }

    post "/api/v1/prescriptions", params: data

    expect(response.status).to eq 400
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:message]).not_to be_empty
  end

  xit 'POST /prescriptions doesnt create prescription without required info' do
    provider  = create(:provider)
    user      = create(:user)
    profile   = create(:profile, user_id: user.id, provider_id: provider.id )
    create(:insurance, profile_id: profile.id)
    data = { api_key: user.api_key,
             profile_id: profile.id,
             provider_id: provider.id
    }

    post "/api/v1/prescriptions", params: data

    expect(response.status).to eq 400
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:message]).not_to be_empty
  end

  xit 'deletes an prescription' do
    provider  = create(:provider)
    user      = create(:user)
    profile   = create(:profile, user_id: user.id, provider_id: provider.id )
    create(:insurance, profile_id: profile.id)
    appt = create(:prescription, profile_id: profile.id)

    data = { api_key: user.api_key, profile_id: profile.id, appointment_id: appt.id }
    delete "/api/v1/prescriptions", params: data
    expect(response.status).to eq 200
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:message]).to eq("Appointment deleted!")
  end

  xit 'does not delete an appointment with bad api key' do
    provider  = create(:provider)
    user      = create(:user)
    profile   = create(:profile, user_id: user.id, provider_id: provider.id )
    create(:insurance, profile_id: profile.id)
    appt = create(:appointment, profile_id: profile.id)

    data = { api_key: 'hahahaha', profile_id: profile.id, appointment_id: appt.id }
    delete "/api/v1/prescriptions", params: data
    expect(response.status).to eq 400
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:message]).not_to be_empty
  end

end
