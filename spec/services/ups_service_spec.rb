require 'rails_helper'

describe UpsService do
	it 'returns normalized address' do
    address = {street_address: '2258 West 35th',
               city: 'Denver',
              state: 'CO'}

		service = UpsService.new(address)
		expect(service).to be_a(UpsService)
		actual = service.valid_address[:XAVResponse][:Candidate][:AddressKeyFormat]
		expect(actual[:AddressLine]).not_to be_empty
		expect(actual[:PoliticalDivision2]).not_to be_empty
		expect(actual[:PoliticalDivision1]).not_to be_empty
		expect(actual[:PostcodePrimaryLow]).not_to be_empty
		expect(actual[:PostcodeExtendedLow]).not_to be_empty

  end
	
end
