class UspsService

  def initialize(address)
    @street_address = address[:street_address]
    @city           = address[:city]
    @state          = address[:state]
    @validated      = valid_address
  end

  def valid_address
    response = Faraday.get("http://production.shippingapis.com/ShippingAPITest.dll?API=Verify&XML=<AddressValidateRequest USERID=#{ENV['usps_userid']}><AddressID='0'><Address1></Address1><Address2>6406 Ivy Lane</Address2><City>Greenbelt</City><State>MD</State><Zip5></Zip5><Zip4></Zip4></Address></AddressValidateRequest>")
    require "pry"; binding.pry
    @valid_address ||= JSON.parse(response.body, symbolize_names: true)
  end

end
