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

  it 'returns api key for existing user' do
    user = create(:user)

    get "/api/v1/users?email=#{user.email}&password=#{user.password}"
    expect(response.status).to eq(200)
    parsed_response = JSON.parse(response.body)
    key = parsed_response["data"]["attributes"]["api_key"]

    expect(key).to eq(User.last.api_key)
  end
end
