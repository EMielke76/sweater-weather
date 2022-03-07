require 'rails_helper'

RSpec.describe 'Login Endpoint' do
  context 'happy path' do
    it 'logs a user in when given correct credentials' do
      VCR.use_cassette('user-exists') do
        api_key = ApiKey.create
        user = User.create!(email: "faker@notreal.net", password: "123ThisIsFake", password_confirmation: "123ThisIsFake", api_key: api_key.access_token )
        headers = { 'CONTENT_TYPE' => 'application/json' }
        params = {
             "email"=>"faker@notreal.net",
             "password"=>"123ThisIsFake"
          }

        post '/api/v1/sessions', headers: headers, params: JSON.generate(params)

        results = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(200)

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

        attributes = data[:attributes]

        expect(attributes).to have_key(:email)
        expect(attributes[:email]).to be_a(String)

        expect(attributes).to have_key(:api_key)
        expect(attributes[:api_key]).to be_a(String)
      end
    end
  end

  context 'sad path' do
    it 'returns an error when given an incorrect password' do
      VCR.use_cassette('wrong-password') do
        user = User.create!(email: "faker@notreal.net", password: "123ThisIsFake", password_confirmation: "123ThisIsFake")
        headers = { 'CONTENT_TYPE' => 'application/json' }
        params = {
             "email"=>"faker@notreal.net",
             "password"=>"123ThisIsReal"
          }

        post '/api/v1/sessions', headers: headers, params: JSON.generate(params)

        results = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(400)

        expect(results).to be_a(Hash)
        expect(results).to have_key(:status)
        expect(results[:status]).to eq(400)

        expect(results).to have_key(:message)
        expect(results[:message]).to eq("Email or Password is incorrect")

        expect(results).to have_key(:data)
        expect(results[:data]).to eq({})
      end
    end

    it 'returns an error if the user doesnt exist' do
      VCR.use_cassette('user-doesnt-exist') do
      
        headers = { 'CONTENT_TYPE' => 'application/json' }
        params = {
             "email"=>"faker@notreal.net",
             "password"=>"123ThisIsReal"
          }

        post '/api/v1/sessions', headers: headers, params: JSON.generate(params)

        results = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(400)

        expect(results).to be_a(Hash)
        expect(results).to have_key(:status)
        expect(results[:status]).to eq(400)

        expect(results).to have_key(:message)
        expect(results[:message]).to eq("Email or Password is incorrect")

        expect(results).to have_key(:data)
        expect(results[:data]).to eq({})
      end
    end
  end
end
