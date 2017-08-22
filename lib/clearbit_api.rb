require "clearbit_api/version"
require "httparty"

module ClearbitApi
  class Company
    def self.search(company)
      # get call on REST API
      base_url = "https://autocomplete.clearbit.com/v1/companies/suggest?query="
      response = HTTParty.get(base_url + company)

      # parse data
      begin
        data = JSON.parse(response.body, {symbolize_names: true})
      rescue JSON::ParserError
        data = {error: "Clearbit Error"}
      end
    end
  end
end
