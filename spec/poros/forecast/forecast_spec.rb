require 'rails_helper'

RSpec.describe Forecast do
  let!(:current_weather) {
    {
    datetime: "2022-03-05 14:17:26.650002 -0700",
    sunrise: "2022-03-05 14:17:26.650002 -0700",
    sunset: "2022-03-05 14:17:26.650002 -0700",
    temperature: 48.06,
    feels_like: 50.00,
    humidity: 12345,
    uvi: 123.44,
    visibility: 12345,
    conditions: "Badass",
    icon: "10d"
    }
  }

  let!(:daily_weather) {
    [{
      date: "2022-03-05 14:17:26.650002 -0700",
      sunrise: "2022-03-05 14:17:26.650002 -0700",
      sunset: "2022-03-05 14:17:26.650002 -0700",
      max_temp: 123.45,
      min_temp: 1.2345,
      conditions: "Badass",
      icon: "10d"
    }]
  }

  let!(:hourly_weather) {
    [{
      time: "2022-03-05 14:17:26.650002 -0700",
      temperature: 123.45,
      conditions: "Badass",
      icon: "10d"
    }]
  }

  let!(:forecast) { Forecast.new(current_weather, daily_weather, hourly_weather) }

  it 'exists' do
    expect(forecast).to be_a(Forecast)
  end

  describe 'attributes' do
    it 'has current weather' do
      expect(forecast.current_weather).to be_a(Hash)
      expect(forecast.current_weather).to have_key(:datetime)
      expect(forecast.current_weather).to have_key(:sunrise)
      expect(forecast.current_weather).to have_key(:sunset)
      expect(forecast.current_weather).to have_key(:temperature)
      expect(forecast.current_weather).to have_key(:feels_like)
      expect(forecast.current_weather).to have_key(:humidity)
      expect(forecast.current_weather).to have_key(:uvi)
      expect(forecast.current_weather).to have_key(:visibility)
      expect(forecast.current_weather).to have_key(:conditions)
      expect(forecast.current_weather).to have_key(:icon)
    end

    it 'has daily weather' do
      expect(forecast.daily_weather).to be_a(Array)
      expect(forecast.daily_weather.first).to be_a(Hash)

      first = forecast.daily_weather.first
      expect(first).to have_key(:date)
      expect(first).to have_key(:sunrise)
      expect(first).to have_key(:sunset)
      expect(first).to have_key(:max_temp)
      expect(first).to have_key(:min_temp)
      expect(first).to have_key(:conditions)
      expect(first).to have_key(:icon)
    end

    it 'has hourly weather' do
      expect(forecast.hourly_weather).to be_a(Array)
      expect(forecast.hourly_weather.first).to be_a(Hash)

      first = forecast.hourly_weather.first
      expect(first).to have_key(:time)
      expect(first).to have_key(:temperature)
      expect(first).to have_key(:conditions)
      expect(first).to have_key(:icon)
    end
  end
end
