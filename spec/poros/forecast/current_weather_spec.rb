require 'rails_helper'

RSpec.describe CurrentWeather do
  let!(:attributes) {
      {
      dt: 1646506357,
      sunrise: 1646486827,
      sunset: 1646528160,
      temp: 48.06,
      feels_like: 50.00,
      humidity: 12345,
      uvi: 123.44,
      visibility: 12345,
      weather: [{ description: "Badass", icon: "10d"}]
      }
    }

  let!(:weather) { CurrentWeather.new(attributes) }

  it 'exists' do
    expect(weather).to be_a(CurrentWeather)
  end

  it 'has attributes' do
    expect(weather.datetime).to eq(Time.at(attributes[:dt]).to_s)
    expect(weather.sunrise).to eq(Time.at(attributes[:sunrise]).to_s)
    expect(weather.sunset).to eq(Time.at(attributes[:sunset]).to_s)
    expect(weather.temperature).to eq(48.06)
    expect(weather.feels_like).to eq(50.00)
    expect(weather.humidity).to eq(12345)
    expect(weather.uvi).to eq(123.44)
    expect(weather.visibility).to eq(12345)
    expect(weather.conditions).to eq("Badass")
    expect(weather.icon).to eq("10d")
  end
end
