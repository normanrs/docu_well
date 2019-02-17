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
      street_address: '2000 Upity Street',
      city: 'St. Paul',
      state: 'MN',
      zip: '90210',
      phone: '101-555-1212',
    }

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
  end

  it 'POST /providers returns 422 error on bad data' do
    user      = create(:user)
    data = {
      api_key: user.api_key,
      given_name: 'Chelsea',
      surname: 'Manchot',
      street_address: '2000 Upity Street',
      city: 'St. Paul',
      state: 'xx',
      zip: '90210',
      phone: '101-555-1212',
    }

    post "/api/v1/providers", params: data

    expect(response.status).to eq 422
    data = JSON.parse(response.body, symbolize_names: true)
  end

  it 'POST /providers returns 422 error on bad api key' do
    user      = create(:user)
    data = {
      api_key: "hahahaha",
      given_name: 'Chelsea',
      surname: 'Manchot',
      street_address: '2000 Upity Street',
      city: 'St. Paul',
      state: 'TX',
      zip: '90210',
      phone: '101-555-1212',
    }

    post "/api/v1/providers", params: data

    expect(response.status).to eq 422
    data = JSON.parse(response.body, symbolize_names: true)
  end

end
