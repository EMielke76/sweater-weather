require 'rails_helper'

RSpec.describe 'Background image endpoint' do
  context 'happy path' do
    it 'returns image data of the requested city' do
      VCR.use_cassette('denver-image-search') do
        location = "Denver,CO"

        get "/api/vi/backgrounds?location=#{location}"

        results = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(200)

        expect(results).to be_a(Hash)
        expect(results).to have_key(:data)
        expect(results[:data]).to be_a(Hash)

        data = results[:data]

        expect(data).to have_key(:type)
        expect(data[:type]).to be_a(String)

        expect(data).to have_key(:id)
        expect(data[:id]).to eq(nil)

        expect(data).to have_key(:attributes)
        expect(data[:attributes]).to be_a(Hash)

        attributes = data[:attributes]

        expect(attributes).to have_key(:image)
        expect(attributes[:image]).to be_a(Hash)

        image = attributes[:image]

        expect(image).to have_key(:url)
        expect(image[:url]).to eq(string)

        expect(image).to have_key(:photographer)
        expect(image[:photographer]).to be_a(String)

        expect(image).to have_key(:photographer_url)
        expect(image[:photographer_url]).to be_a(String)
      end
    end
end
