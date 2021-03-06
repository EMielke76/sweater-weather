require 'rails_helper'

RSpec.describe "Registering a user" do
  context 'happy path' do
    it 'returns a users data and api key when given correct data' do
      VCR.use_cassette('registering-a-user') do
        headers = { 'CONTENT_TYPE' => 'application/json' }
        params = {
          "user"=> {
             "email"=>"faker@notreal.net",
             "password"=>"123ThisIsFake",
             "password_confirmation"=>"123ThisIsFake"
            }
          }

        post "/api/v1/users", headers: headers, params: JSON.generate(params)
        results = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(201)

        expect(results).to be_a(Hash)
        expect(results).to have_key(:data)
        expect(results[:data]).to be_a(Hash)
        expect(results[:data].keys.count).to eq(3)

        data = results[:data]
        expect(data).to have_key(:type)
        expect(data[:type]).to eq("users")

        expect(data).to have_key(:id)
        expect(data[:id]).to be_a(String)

        expect(data).to have_key(:attributes)
        expect(data[:attributes]).to be_a(Hash)
        expect(data[:attributes].keys.count).to eq(2)

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
        user = User.create!(email: "faker@notreal.net", password: "yup", password_confirmation: "yup")

        headers = { 'CONTENT_TYPE' => 'application/json' }
        params = {
          "user"=> {
             "email"=>"faker@notreal.net",
             "password"=>"123ThisIsFake",
             "password_confirmation"=>"123ThisIsFake"
            }
          }

        post "/api/v1/users", headers: headers, params: JSON.generate(params)
        results = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(400)

        expect(results).to have_key(:status)
        expect(results[:status]).to eq(400)

        expect(results).to have_key(:message)
        expect(results[:message]).to eq("Email has already been taken")

        expect(results).to have_key(:data)
        expect(results[:data]).to eq({})
      end
    end

    it 'returns an error if email is empty' do
      VCR.use_cassette('email-empty') do
        headers = { 'CONTENT_TYPE' => 'application/json' }
        params = params = {
          "user"=> {
             "email"=>"",
             "password"=>"123Fake",
             "password_confirmation"=>"123Fake"
            }
          }

        post "/api/v1/users", headers: headers, params: JSON.generate(params)
        results = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(400)

        expect(results).to have_key(:status)
        expect(results[:status]).to eq(400)

        expect(results).to have_key(:message)
        expect(results[:message]).to eq("Email can't be blank and Email is invalid")

        expect(results).to have_key(:data)
        expect(results[:data]).to eq({})
      end
    end

    it 'returns an error if email is not an email' do
      VCR.use_cassette('email-empty') do
        headers = { 'CONTENT_TYPE' => 'application/json' }
        params = params = {
          "user"=> {
             "email"=>"sakdjoiewhowihr",
             "password"=>"123Fake",
             "password_confirmation"=>"123Fake"
            }
          }

        post "/api/v1/users", headers: headers, params: JSON.generate(params)
        results = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(400)

        expect(results).to have_key(:status)
        expect(results[:status]).to eq(400)

        expect(results).to have_key(:message)
        expect(results[:message]).to eq("Email is invalid")

        expect(results).to have_key(:data)
        expect(results[:data]).to eq({})
      end
    end

    it 'returns an error is passwords do not match' do
      VCR.use_cassette('passwords-do-not-match') do
        headers = { 'CONTENT_TYPE' => 'application/json' }
        params = params = {
          "user"=> {
             "email"=>"faker@notreal.net",
             "password"=>"123ThisIsFake",
             "password_confirmation"=>"123ThisIsReal"
            }
          }

        post "/api/v1/users", headers: headers, params: JSON.generate(params)
        results = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(400)

        expect(results).to have_key(:status)
        expect(results[:status]).to eq(400)

        expect(results).to have_key(:message)
        expect(results[:message]).to eq("Password confirmation doesn't match Password")

        expect(results).to have_key(:data)
        expect(results[:data]).to eq({})
      end
    end

    it 'returns an error if passwords are empty' do
      VCR.use_cassette('passwords-empty') do
        headers = { 'CONTENT_TYPE' => 'application/json' }
        params = params = {
          "user"=> {
             "email"=>"faker@notreal.net",
             "password"=>"",
             "password_confirmation"=>""
            }
          }

        post "/api/v1/users", headers: headers, params: JSON.generate(params)
        results = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(400)

        expect(results).to have_key(:status)
        expect(results[:status]).to eq(400)

        expect(results).to have_key(:message)
        expect(results[:message]).to eq("Password digest can't be blank and Password can't be blank")

        expect(results).to have_key(:data)
        expect(results[:data]).to eq({})
      end
    end
  end
end
