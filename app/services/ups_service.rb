class UpsService

  def initialize(data)
    @json_request = {
      "UPSSecurity": {
        "UsernameToken": {
          "Username": "#{ENV['ups_login']}", "Password": "#{ENV['ups_pwd']}"
          }, "ServiceAccessToken": {
            "AccessLicenseNumber": "#{ENV['ups_id']}" }
            }, "XAVRequest": {
              "Request": {
                "RequestOption": "1", "TransactionReference": {
                  "CustomerContext": "My Health Tracker" }
                },
                "MaximumListSize": "1", "AddressKeyFormat": { "AddressLine": "#{data[:street_address]}", "PoliticalDivision2": "#{data[:city]}", "PoliticalDivision1": "#{data[:state]}", "PostcodePrimaryLow": "", "CountryCode": "US"
                  } }
                }
  end

  def valid_address
    begin
      response = conn.post do |stuff|
        stuff.url "/rest/XAV"
        stuff.body = @json_request.to_json
      end
      @parsed ||= JSON.parse(response.body, symbolize_names: true)
      raise 'Bad request' if @parsed[:XAVResponse][:NoCandidatesIndicator]
    rescue StandardError => err
      @parsed = JSON.parse({ :message => err.to_s}.to_json, symbolize_names: true)
    end
    @parsed
  end

private

	def conn
		Faraday.new(url: "https://onlinetools.ups.com") do |req|
      req.headers['Content-Type'] = 'application/json'
			req.adapter Faraday.default_adapter
		end
	end

end
