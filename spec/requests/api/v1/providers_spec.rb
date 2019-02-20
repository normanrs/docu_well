require 'rails_helper'

describe 'the provider endpoint' do
  it 'GET /providers returns profile content in json' do
    create_list(:provider, 5)

    get "/api/v1/providers"
    expect(response.status).to eq 200
    data = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(data[0][:id]).not_to be_empty
    expect(data[0][:attributes]).not_to be_empty
    expect(data[0][:attributes].keys.include?(:given_name)).to be(true)
    expect(data[0][:attributes].keys.include?(:surname)).to be(true)
    expect(data[0][:attributes].keys.include?(:street_address)).to be(true)
    expect(data[0][:attributes].keys.include?(:city)).to be(true)
    expect(data[0][:attributes].keys.include?(:state)).to be(true)
    expect(data[0][:attributes].keys.include?(:zip)).to be(true)
    expect(data[0][:attributes].keys.include?(:phone)).to be(true)
  end

  it 'POST /providers creates provider and returns provider content in json' do
    user      = create(:user)
    data = {
      api_key: user.api_key,
      given_name: 'Chelsea',
      surname: 'Manchot',
      street_address: '2258 W 35th Ave',
      city: 'Denver',
      state: 'CO',
      zip: '80211',
      phone: '101-555-1212'}

    post "/api/v1/providers", params: data
    expect(response.status).to eq 201
    data = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(data[:id]).not_to be_empty
    expect(data[:attributes]).not_to be_empty
    expect(data[:attributes].keys.include?(:given_name)).to be(true)
    expect(data[:attributes].keys.include?(:surname)).to be(true)
    expect(data[:attributes].keys.include?(:street_address)).to be(true)
    expect(data[:attributes].keys.include?(:city)).to be(true)
    expect(data[:attributes].keys.include?(:state)).to be(true)
    expect(data[:attributes].keys.include?(:zip)).to be(true)
    expect(data[:attributes].keys.include?(:phone)).to be(true)
    expect(data[:attributes].keys.include?(:speciality)).to be(true)
  end

  it 'POST /providers creates provider and returns provider content in json' do
    user      = create(:user)
    data = {
      api_key: user.api_key,
      given_name: 'Chelsea',
      surname: 'Manchot',
      street_address: '0 Does not exist street',
      city: 'Denver',
      state: 'CO',
      zip: '80211',
      phone: '101-555-1212'}

      post "/api/v1/providers", params: data
      expect(response.status).to eq 400
      data = JSON.parse(response.body, symbolize_names: true)
      expect(data[:message]).not_to be_empty
  end

  it 'POST /providers returns 400 error on missing data' do
    user      = create(:user)
    data = {
      api_key: user.api_key,
      given_name: 'Chelsea',
      surname: 'Manchot',
      street_address: '2000 Upity Street',
      city: 'St. Paul',
      zip: '90210',
      phone: '101-555-1212'}

    post "/api/v1/providers", params: data
    expect(response.status).to eq 400
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:message]).not_to be_empty
  end

  it 'POST /providers returns 400 error on bad api key' do
    user      = create(:user)
    data = {
      api_key: "hahahaha",
      given_name: 'Chelsea',
      surname: 'Manchot',
      street_address: '2000 Upity Street',
      city: 'St. Paul',
      state: 'TX',
      zip: '90210',
      phone: '101-555-1212'}

    post "/api/v1/providers", params: data
    expect(response.status).to eq 400
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:message]).not_to be_empty
  end

end
