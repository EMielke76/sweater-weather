require 'rails_helper'

RSpec.describe ForcastService do
  context 'instance methods' do
    context '#forcast' do
      it 'returns weather data' do
        VCR.use_cassette('denver-forcast') do
          lat = 39.738453
          long = -104.984853

          query = ForcastService.new
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
  end
end
