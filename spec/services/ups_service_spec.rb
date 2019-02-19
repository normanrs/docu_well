require 'rails_helper'

describe UpsService do
	it 'returns normalized address' do
		VCR.use_cassette("denver_address") do
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

	it 'doesnt return normalized address on bad info' do
		VCR.use_cassette("bad_address") do

	    address = {street_address: 'hahahahaha',
	               city: 'Denver',
	              state: 'CO'}

			service = UpsService.new(address)
			expect(service).to be_a(UpsService)
			actual = service.valid_address
			expect(actual).not_to be_empty
		end
  end

end
