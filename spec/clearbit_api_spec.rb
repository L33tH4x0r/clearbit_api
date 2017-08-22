require "spec_helper"

RSpec.describe ClearbitApi do
  it "has a version number" do
    expect(ClearbitApi::VERSION).not_to be nil
  end

  describe ClearbitApi::Company do
    describe "search" do
      let(:base_url) { "https://autocomplete.clearbit.com/v1/companies/suggest?query=" }
      let(:query) { "Dringo" }
      let(:expected_url) { "#{base_url}#{query}" }
      let(:response) { double(body: '{"company": "Dringo"}') }
      let(:parse_response) { { company: query } }

      it "returns a ruby hash after a successful request" do
        expect(HTTParty).to receive(:get).with(expected_url).and_return(response)

        expect(ClearbitApi::Company.search(query)).to eq parse_response
      end
    end
  end
end
