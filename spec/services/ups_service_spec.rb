require 'rails_helper'

describe UpsService do
  it 'returns normalized address' do
    VCR.use_cassette('denver_address') do
      address = {street_address: '2258 West 35th',
                 city: 'Denver',
                 state: 'CO'}

      service = UpsService.new(address)
      expect(service).to be_a(UpsService)
      actual = service.result[:XAVResponse][:Candidate][:AddressKeyFormat]
      expect(actual[:AddressLine]).to eq('2258 W 35TH AVE')
      expect(actual[:PoliticalDivision2]).to eq('DENVER')
      expect(actual[:PoliticalDivision1]).to eq('CO')
      expect(actual[:PostcodePrimaryLow]).to eq('80211')
      expect(actual[:PostcodeExtendedLow]).to eq('2908')
    end
  end

  it 'doesnt return normalized address on bad info' do
    VCR.use_cassette('bad_address') do
      address = {street_address: 'hahahahaha',
                 city: 'Denver',
                 state: 'CO'}

      service = UpsService.new(address)
      expect(service).to be_a(UpsService)
      actual = service.result
      expect(actual[:message]).to eq('Bad request')
    end
  end

end
