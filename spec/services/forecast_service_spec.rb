require 'rails_helper'

RSpec.describe ForecastService do
  context 'instance methods' do
    context '#forecast' do
      it 'returns weather data' do
        VCR.use_cassette('denver-forcast') do
          lat = 39.738453
          long = -104.984853

          query = ForecastService.new
          results = query.forecast(lat, long)

          expect(results).to be_a(Hash)
          expect(results).to have_key(:current)
          expect(results[:current]).to be_a(Hash)

          current_weather = results[:current]
          expect(current_weather).to have_key(:dt)
          expect(current_weather[:dt]).to be_a(Integer)

          expect(current_weather).to have_key(:sunrise)
          expect(current_weather[:sunrise]).to be_a(Integer)

          expect(current_weather).to have_key(:sunset)
          expect(current_weather[:sunset]).to be_a(Integer)

          expect(current_weather).to have_key(:temp)
          expect(current_weather[:temp]).to be_a(Float)

          expect(current_weather).to have_key(:feels_like)
          expect(current_weather[:feels_like]).to be_a(Float)

          expect(current_weather).to have_key(:humidity)
          expect(current_weather[:humidity]).to be_a(Integer)

          expect(current_weather).to have_key(:uvi)
          expect(current_weather[:uvi]).to be_a(Float)

          expect(current_weather).to have_key(:visibility)
          expect(current_weather[:visibility]).to be_a(Integer)

          expect(current_weather).to have_key(:weather)
          expect(current_weather[:weather]).to be_a(Array)
          expect(current_weather[:weather].first).to be_a(Hash)

          weather = current_weather[:weather].first
          expect(weather).to have_key(:description)
          expect(weather[:description]).to be_a(String)

          expect(weather).to have_key(:icon)
          expect(weather[:icon]).to be_a(String)
        end
      end
    end

    context '#roadtrip' do
      it 'returns hourly weather data on a location' do
        VCR.use_cassette('LA-48hrs') do
          lat = 34.052223
          long = -118.243355

          query = ForecastService.new
          result = query.roadtrip(lat, long)

          expect(result).to be_a(Hash)
          expect(result).to have_key(:timezone)
          expect(result[:timezone]).to eq("America/Los_Angeles")

          expect(result).to have_key(:hourly)
          expect(result[:hourly]).to be_a(Array)

          hourly = result[:hourly].first

          expect(hourly).to have_key(:dt)
          expect(hourly[:dt]).to be_a(Integer)

          expect(hourly).to have_key(:temp)
          expect(hourly[:temp]).to be_a(Float)

          expect(hourly).to have_key(:weather)
          expect(hourly[:weather]).to be_a(Array)

          weather = hourly[:weather].first

          expect(weather).to have_key(:description)
          expect(weather[:description]).to be_a(String)
        end
      end
    end
  end
end
