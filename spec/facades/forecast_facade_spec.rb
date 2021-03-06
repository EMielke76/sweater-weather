require 'rails_helper'

RSpec.describe ForecastFacade do
  context 'class methods' do
    describe '::forecast' do
      it 'returns Forecast data', :vcr do
        lat = 39.738453
        long = -104.984853
        results = ForecastFacade.forecast(lat, long)

        expect(results).to be_a(Forecast)
        expect(results.current_weather).to be_a(CurrentWeather)

        expect(results.daily_weather).to be_a(Array)
        expect(results.daily_weather.count).to eq(5)
        results.daily_weather.each do |day|
          expect(day).to be_a(DailyWeather)
        end

        expect(results.hourly_weather).to be_a(Array)
        expect(results.hourly_weather.count).to eq(8)
        results.hourly_weather.each do |hour|
          expect(hour).to be_a(HourlyWeather)
        end
      end
    end

    describe '#roadtrip' do
      it 'returns HouryWeather data', :vcr do
        lat = 34.052223
        long = -118.243355
        results = ForecastFacade.roadtrip(lat, long)

        expect(results).to be_a(Array)
        results.each do |result|
          expect(result).to be_a(HourlyWeather)
        end
      end
    end
  end
end
