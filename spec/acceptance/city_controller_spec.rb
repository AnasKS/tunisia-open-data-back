# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Cities' do
  header 'Accept', 'application/vnd.api+json'
  header 'Content-type', 'application/vnd.api+json'

  before do
    @city = City.create(id: 8674, name: 'Tatouine')
  end

  route '/v1/cities', 'Cities Collection' do
    get 'get cities' do
      example 'get cities.' do
        do_request
        JSON.parse(response_body)['data']
        # uncomment me to debug
        print response_body
        expect(status).to eq(200)
      end
    end
  end
end
