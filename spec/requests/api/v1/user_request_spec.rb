require 'rails_helper'

RSpec.describe 'POST /users' do
  it 'creates user and returns their api key' do
    data = { email: 'email@gmail.com', password: '12345' }
    post "/api/v1/users", params: data
    expect(response.status).to eq(201)
    parsed_response = JSON.parse(response.body)
    key = parsed_response["data"]["attributes"]["api_key"]
    expect(key).to eq(User.last.api_key)
  end

  it 'doesnt create a user with same email as another user' do
    user      = create(:user)

    data = { email: user.email, password: '12345' }
    post "/api/v1/users", params: data
    expect(response.status).to eq(400)
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:message]).not_to be_empty
  end

  it 'returns api key for existing user' do
    user = create(:user)

    get "/api/v1/users?email=#{user.email}&password=#{user.password}"
    expect(response.status).to eq(200)
    parsed_response = JSON.parse(response.body)
    key = parsed_response["data"]["attributes"]["api_key"]

    expect(key).to eq(User.last.api_key)
  end
end
