require 'rails_helper'

RSpec.describe 'Forecast Endpoint' do
  context 'happy path' do
    it 'sends forecast data of a given location' do
      VCR.use_cassette('denver-location-and-forecast') do
        location = "Denver,CO"

        get "/api/v1/forecast?location=#{location}"

        results = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(200)
        expect(results).to have_key(:data)
        expect(results[:data]).to be_a(Hash)
        expect(results[:data].keys.count).to eq(3)

        data = results[:data]
        expect(data).to have_key(:id)
        expect(data[:id]).to eq(nil)

        expect(data).to have_key(:type)
        expect(data[:type]).to eq("forecast")

        expect(data).to have_key(:attributes)
        expect(data[:attributes]).to be_a(Hash)
        expect(data[:attributes].keys.count).to eq(3)

        attributes = data[:attributes]
        expect(attributes).to have_key(:current_weather)
        expect(attributes[:current_weather]).to be_a(Hash)
        expect(attributes[:current_weather].keys.count).to eq(10)

        current_weather = attributes[:current_weather]
        expect(current_weather).to have_key(:datetime)
        expect(current_weather[:datetime]).to be_a(String)

        expect(current_weather).to have_key(:sunrise)
        expect(current_weather[:sunrise]).to be_a(String)

        expect(current_weather).to have_key(:sunset)
        expect(current_weather[:sunset]).to be_a(String)

        expect(current_weather).to have_key(:temperature)
        expect(current_weather[:temperature]).to be_a(Float)

        expect(current_weather).to have_key(:feels_like)
        expect(current_weather[:feels_like]).to be_a(Float)

        expect(current_weather).to have_key(:humidity)
        expect(current_weather[:humidity]).to be_a(Integer)

        expect(current_weather).to have_key(:uvi)
        expect(current_weather[:uvi]).to be_a(Float)

        expect(current_weather).to have_key(:visibility)
        expect(current_weather[:visibility]).to be_a(Integer)

        expect(current_weather).to have_key(:conditions)
        expect(current_weather[:conditions]).to be_a(String)

        expect(current_weather).to have_key(:icon)
        expect(current_weather[:icon]).to be_a(String)

        #DailyWeather
        expect(attributes).to have_key(:daily_weather)
        expect(attributes[:daily_weather]).to be_a(Array)
        expect(attributes[:daily_weather].first).to be_a(Hash)
        expect(attributes[:daily_weather].count).to eq(5)
        attributes[:daily_weather].each do |day|
          expect(day.keys.count).to eq(7)
        end

        daily_weather = attributes[:daily_weather].first
        expect(daily_weather).to have_key(:date)
        expect(daily_weather[:date]).to be_a(String)

        expect(daily_weather).to have_key(:sunrise)
        expect(daily_weather[:sunrise]).to be_a(String)

        expect(daily_weather).to have_key(:sunset)
        expect(daily_weather[:sunset]).to be_a(String)

        expect(daily_weather).to have_key(:max_temp)
        expect(daily_weather[:max_temp]).to be_a(Float)

        expect(daily_weather).to have_key(:min_temp)
        expect(daily_weather[:min_temp]).to be_a(Float)

        expect(daily_weather).to have_key(:conditions)
        expect(daily_weather[:conditions]).to be_a(String)

        expect(daily_weather).to have_key(:icon)
        expect(daily_weather[:icon]).to be_a(String)

        #Hourly Weather
        expect(attributes).to have_key(:hourly_weather)
        expect(attributes[:hourly_weather]).to be_a(Array)
        expect(attributes[:hourly_weather].first).to be_a(Hash)
        expect(attributes[:hourly_weather].count).to eq(8)
        attributes[:hourly_weather].each do |hour|
          expect(hour.keys.count).to eq(4)
        end

        hourly_weather = attributes[:hourly_weather].first
        expect(hourly_weather).to have_key(:time)
        expect(hourly_weather[:time]).to be_a(String)

        expect(hourly_weather).to have_key(:temperature)
        expect(hourly_weather[:temperature]).to be_a(Float)

        expect(hourly_weather).to have_key(:conditions)
        expect(hourly_weather[:conditions]).to be_a(String)

        expect(hourly_weather).to have_key(:icon)
        expect(hourly_weather[:icon]).to be_a(String)
      end
    end
  end

  context 'sad path/edge case' do
    it 'returns data even if location is gobbledegook' do
      VCR.use_cassette('location-gobbledegook') do
        location = "32iub8fb"
        get "/api/v1/forecast?location=#{location}"

        results = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(200)
        expect(results).to have_key(:data)
        expect(results[:data]).to be_a(Hash)

        data = results[:data]
        expect(data).to have_key(:id)
        expect(data[:id]).to eq(nil)

        expect(data).to have_key(:type)
        expect(data[:type]).to eq("forecast")

        expect(data).to have_key(:attributes)
        expect(data[:attributes]).to be_a(Hash)

        attributes = data[:attributes]
        expect(attributes).to have_key(:current_weather)
        expect(attributes[:current_weather]).to be_a(Hash)

        expect(attributes).to have_key(:daily_weather)
        expect(attributes[:daily_weather]).to be_a(Array)
        expect(attributes[:daily_weather].first).to be_a(Hash)

        expect(attributes).to have_key(:hourly_weather)
        expect(attributes[:hourly_weather]).to be_a(Array)
        expect(attributes[:hourly_weather].first).to be_a(Hash)

        current_weather = attributes[:current_weather]
        expect(current_weather).to have_key(:datetime)
        expect(current_weather[:datetime]).to be_a(String)

        expect(current_weather).to have_key(:sunrise)
        expect(current_weather[:sunrise]).to be_a(String)

        expect(current_weather).to have_key(:sunset)
        expect(current_weather[:sunset]).to be_a(String)

        expect(current_weather).to have_key(:temperature)
        expect(current_weather[:temperature]).to be_a(Float)

        expect(current_weather).to have_key(:feels_like)
        expect(current_weather[:feels_like]).to be_a(Float)

        expect(current_weather).to have_key(:humidity)
        expect(current_weather[:humidity]).to be_a(Integer)

        expect(current_weather).to have_key(:uvi)
        expect(current_weather[:uvi]).to be_a(Integer)

        expect(current_weather).to have_key(:visibility)
        expect(current_weather[:visibility]).to be_a(Integer)

        expect(current_weather).to have_key(:conditions)
        expect(current_weather[:conditions]).to be_a(String)

        expect(current_weather).to have_key(:icon)
        expect(current_weather[:icon]).to be_a(String)

        daily_weather = attributes[:daily_weather].first
        expect(daily_weather).to have_key(:date)
        expect(daily_weather[:date]).to be_a(String)

        expect(daily_weather).to have_key(:sunrise)
        expect(daily_weather[:sunrise]).to be_a(String)

        expect(daily_weather).to have_key(:sunset)
        expect(daily_weather[:sunset]).to be_a(String)

        expect(daily_weather).to have_key(:max_temp)
        expect(daily_weather[:max_temp]).to be_a(Float)

        expect(daily_weather).to have_key(:min_temp)
        expect(daily_weather[:min_temp]).to be_a(Float)

        expect(daily_weather).to have_key(:conditions)
        expect(daily_weather[:conditions]).to be_a(String)

        expect(daily_weather).to have_key(:icon)
        expect(daily_weather[:icon]).to be_a(String)

        hourly_weather = attributes[:hourly_weather].first
        expect(hourly_weather).to have_key(:time)
        expect(hourly_weather[:time]).to be_a(String)

        expect(hourly_weather).to have_key(:temperature)
        expect(hourly_weather[:temperature]).to be_a(Float)

        expect(hourly_weather).to have_key(:conditions)
        expect(hourly_weather[:conditions]).to be_a(String)

        expect(hourly_weather).to have_key(:icon)
        expect(hourly_weather[:icon]).to be_a(String)
      end
    end

    it 'returns an error if location is blank' do
      VCR.use_cassette('location-blank') do

        get "/api/v1/forecast?location="

        results = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(400)
        expect(results).to have_key(:data)
        expect(results[:data]).to be_a(Hash)
        expect(results[:data]).to eq({})

        expect(results).to have_key(:status)
        expect(results[:status]).to eq("BAD REQUEST")

        expect(results).to have_key(:message)
        expect(results[:message]).to eq("Location cannot be blank")
      end
    end
  end
end
