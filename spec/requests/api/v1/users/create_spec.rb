require 'rails_helper'

RSpec.describe "Registering a user" do
  context 'happy path' do
    it 'returns a users data and api key when given correct data' do
      VCR.use_cassette('registering-a-user') do
        headers = { 'CONTENT_TYPE' => 'application/json' }
        params = {
          "email"=>"faker@notreal.net",
           "password"=>"123ThisIsFake",
           "password_confirmation"=>"123ThisIsFake",
          }

        post "/api/v1/users", headers: headers, params: JSON.generate(params)
        results = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(201)

        expect(results).to be_a(Hash)
        expect(results).to have_key(:data)
        expect(results[:data]).to be_a(Hash)

        data = results[:data]
        expect(data).to have_key(:type)
        expect(data[:type]).to eq("users")

        expect(data).to have_key(:id)
        expect(data[:id]).to be_a(String)

        expect(data).to have_key(:attributes)
        expect(data[:attributes]).to be_a(Hash)

        attributes =  data[:attributes]

        expect(attributes).to have_key(:email)
        expect(attributes[:email]).to be_a(String)

        expect(attributes).to have_key(:api_key)
        expect(attributes[:api_key]).to be_a(String)
      end
    end
  end

  context 'sad path' do
    it 'returns an error if email is a duplicate' do
      VCR.use_cassette('duplicate-email') do
      end
    end

    it 'returns an error is passowords do not match' do
      VCR.use_cassette('passwords-do-not-match') do
      end
    end
  end
end
