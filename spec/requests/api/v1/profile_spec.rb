require 'rails_helper'

describe 'the profile endpoint' do
  it 'returns content json from objects' do
    user = User.create!(email: 'email@gmail.com', password: '12345')
    provider = Provider.create!(first_name: 'Bill',
                                last_name: "Medici",
                                street_address: '21 Bigshot St.',
                                city: 'Louisville',
                                state: 12,
                                zip: 90210,
                                phone: '212-555-1212')

    Profile.create!(            given_name: "Fred",
                                surname: "Johnson",
                                dob: 1200.days.ago,
                                height: 45,
                                weight: 135,
                                bp_systolic: 120,
                                bp_diastolic: 80,
                                heart_rate: 60,
                                blood_type: 3,
                                user_id: user.id,
                                provider_id: provider.id )

    data = { api_key: user.api_key }
    get "/api/v1/profile"

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
