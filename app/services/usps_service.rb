require 'nokogiri'
require 'builder'
class UspsService

  def initialize(address)
    @street_address = address[:street_address]
    @city           = address[:city]
    @state          = address[:state]
    @validated      = valid_address
  end


  def valid_address
    # url = "/ShippingAPI.dll"
    xml_string = "<AddressValidateRequest USERID=#{ENV['usps_userid']}><AddressID='0'><Address1></Address1><Address2>#{@street_address}</Address2><City>#{@city}</City><State>#{@state}</State><Zip5></Zip5><Zip4></Zip4></Address></AddressValidateRequest>"
    xml_string.encode(:xml => :attr)
    # response = conn.get(url)
    # response = Faraday.get(url)
  end

  def test_address
    url = ENV['test_url']
    Faraday.get(url)
  end

  def conn
    xml_string = "<AddressValidateRequest USERID=#{ENV['usps_userid']}><AddressID='0'><Address1></Address1><Address2>#{@street_address}</Address2><City>#{@city}</City><State>#{@state}</State><Zip5></Zip5><Zip4></Zip4></Address></AddressValidateRequest>"
    # response = Faraday.get("http://production.shippingapis.com/ShippingAPI.dll?API=Verify &XML=<AddressValidateRequest USERID=#{ENV['usps_userid']}><AddressID='0'><Address1></Address1><Address2>6406 Ivy Lane</Address2><City>Greenbelt</City><State>MD</State><Zip5></Zip5><Zip4></Zip4></Address></AddressValidateRequest>")
    Faraday.new(:url=>"http://production.shippingapis.com/ShippingAPI.dll") do |faraday|
      faraday.headers['xml version'] = '1.0'
      faraday.params['API'] = 'Verify'
      faraday.params['XML'] = xml_string
      faraday.response :xml,  :content_type => /\bxml$/
      # faraday.use :instrumentation
      faraday.adapter Faraday.default_adapter
    end
  end

end
