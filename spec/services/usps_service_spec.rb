require 'rails_helper'

describe UspsService do

	it 'returns normalized address' do
    address = {street_address: '2258 West 35th',
               city: 'Denver',
              state: 'CO'}

		service = UspsService.new(address)
		expect(service).to be_a(UspsService)
    require "pry"; binding.pry
  end
end
