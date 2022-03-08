require 'rails_helper'

RSpec.describe 'Create a Road Trip endpoint' do
  context 'happy path' do
    it 'returns data on a planned roadtrip' do
      VCR.use_cassette('NY-to-LA') do
        api_key = ApiKey.create
        user = User.create!(email: "faker@notreal.net", password: "123ThisIsFake", password_confirmation: "123ThisIsFake", api_key: api_key.access_token )
        headers = { 'CONTENT_TYPE' => 'application/json' }
        params = {
             "origin"=>"Los Angeles,CA",
             "destination"=>"New York,NY",
             "api_key" => "#{api_key}"
          }

        post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)

        results = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(201)

        expect(results).to be_a(Hash)
        expect(results).to have_key(:data)
        expect(results[:data]).to be_a(Hash)

        data = results[:data]
        expect(data).to have_key(:id)
        expect(data[:id]).to eq(nil)

        expect(data).to have_key(:type)
        expect(data[:type]).to eq("roadtrip")

        expect(data).to have_key(:attributes)
        expect(data[:attributes]).to be_a(Hash)

        attributes = data[:attributes]
        expect(attributes).to have_key(:start_city)
        expect(attributes[:start_city]).to be_a(String)

        expect(attributes).to have_key(:end_city)
        expect(attributes[:end_city]).to be_a(String)

        expect(attributes).to have_key(:travel_time)
        expect(attributes[:travel_time]).to be_a(String)

        expect(attributes).to have_key(:weather_at_eta)
        expect(attributes[:weather_at_eta]).to be_a(Hash)

        weather = attributes[:weather_at_eta]
        expect(weather).to have_key(:temperature)
        expect(weather[:temperature]).to be_a(Float)

        expect(weather).to have_key(:conditions)
        expect(weather[:conditions]).to be_a(String)
      end
    end

    it 'returns data if route is deemed impossible' do
      VCR.use_cassette('NY-to-London') do
      end
    end
  end

  context 'sad path' do
    it 'returns an error if a starting point is not specified' do
      VCR.use_cassette('no-start') do
      end
    end

    it 'returns an error if a destination is not specified' do
      VCR.use_cassette('no-end') do
      end
    end

    it 'returns an error if no API key is included in the request' do
      VCR.use_cassette('no-api-key') do
      end
    end

    it 'returns an error if API key does not match' do
      VCR.use_cassette('invalid-key') do
      end
    end
  end
end
