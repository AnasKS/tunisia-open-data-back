# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'

# rubocop:disable Metrics/BlockLength
resource 'Cities' do
  # SEE: /spec/support/api_basic_context.rb
  include_context 'api basic context'

  # Authorization header holding the user token
  let(:admin_token) { "Bearer #{generate_token(admin)}" }
  let(:auth_token) { admin_token }

  header 'Accept', 'application/vnd.api+json'
  header 'Content-type', 'application/vnd.api+json'
  header 'Authorization', :auth_token

  before do
    @city = create :city, name: 'Tunis'
  end

  route '/v1/cities', 'Cities Collection' do
    get 'Show cities' do
      example 'Show cities' do
        do_request
        # print response_body
        JSON.parse(response_body)['data']
        expect(status).to eq(200)
      end
    end
  end

  route '/v1/cities/:id', 'City' do
    parameter :id, 'City id', required: true, default: '1234'
    get 'Show City' do
      let(:id) { @city.id }
      example 'Show city' do
        do_request
        # print response_body
        expect(status).to eq(200)
        data = JSON.parse(response_body)['data']
        expect(data['attributes']['name']).to eq 'Tunis'
      end
    end

    put 'Update City' do
      let(:raw_post) { @payload.to_json }
      let(:id) { @city.id }
      before do
        @payload = {
          data: {
            id: id,
            type: 'cities',
            attributes: {
              name: 'Sfax'
            }
          }
        }
      end

      example 'Update city name' do
        expect(City.find(@city.id).name).to eq('Tunis')
        do_request
        # print response_body
        expect(status).to eq(200)
        data = JSON.parse(response_body)['data']
        expect(data['attributes']['name']).to eq('Sfax')
        expect(City.find(@city.id).name).to eq('Sfax')
      end
    end

    delete 'Delete City' do
      let(:id) { @city.id }
      example 'Delete city' do
        do_request
        # print response_body
        expect(status).to eq(204)
        expect(City.find_by(id: id)).to eq(nil)
        expect(City.count).to eq(0)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
