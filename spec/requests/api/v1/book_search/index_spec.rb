require 'rails_helper'

RSpec.describe "BookSearch endpoint" do
  context 'happy path' do
    it 'returns book and forecast data according to given parameters' do
      VCR.use_cassette('denver-book-weather') do
        location = "denver,co"
        quantity = 5

        get "/api/v1/book-search?location=#{location}&quantity=#{quantity}"

        results = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(200)

        expect(results).to be_a(Hash)
        expect(results).to have_key(:data)
        expect(results[:data]).to be_a(Hash)

        data = results[:data]

        expect(data).to have_key(:id)
        expect(data[:id]).to eq(nil)

        expect(data).to have_key(:type)
        expect(data[:type]).to eq("books")

        expect(data).to have_key(:attributes)
        expect(data[:attributes]).to be_a(Hash)

        attributes = data[:attributes]
        expect(attributes).to have_key(:destination)
        expect(attributes[:destination]).to eq("#{location}")

        expect(attributes).to have_key(:forecast)
        expect(attributes[:forecast]).to be_a(Hash)

        expect(attributes).to have_key(:total_books_found)
        expect(attributes[:total_books_found]).to be_a(Integer)

        expect(attributes).to have_key(:books)
        expect(attributes[:books]).to be_a(Array)

        forecast = attributes[:forecast]
        expect(forecast).to have_key(:summary)
        expect(forecast[:summary]).to be_a(String)

        expect(forecast).to have_key(:temperature)
        expect(forecast[:temperature]).to be_a(String)

        book = attributes[:books].first
        expect(book).to have_key(:isbn)
        expect(book[:isbn]).to be_a(Array)
        book[:isbn].each do |num|
          expect(num).to be_a(String)
        end

        expect(book).to have_key(:title)
        expect(book[:title]).to be_a(String)

        expect(book).to have_key(:publisher)
        expect(book[:publisher]).to be_a(Array)
        book[:publisher].each do |pub|
          expect(pub).to be_a(String)
        end
      end
    end
  end

  context 'sad path' do
    it 'returns 400 if parameters are missing' do
      VCR.use_cassette('missing-location') do
        quantity = 5

        get "/api/v1/book-search?location=#{location}&quantity=#{quantity}"

        results = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(400)
        expect(results).to have_key(:data)
        expect(reuls[:data]).to eq({})

        expect(results).to have_key(:status)
        expect(results[:status]).to eq("ERROR")

        expect(results).to have_key(:message)
        expect(results[:message]).to eq("No location specified")
      end
    end
  end
end
