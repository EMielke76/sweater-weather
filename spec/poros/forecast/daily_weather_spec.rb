require 'rails_helper'

RSpec.describe DailyWeather do
  let!(:attributes) {
    {
      dt: 1646506800,
      sunrise: 1646486827,
      sunset: 1646528160,
      temp: {max: 123.45, min: 1.2345},
      weather: [{description: "Badass", icon: "10d"}]
    }
  }

  let!(:weather) { DailyWeather.new(attributes) }

  it 'exists' do
    expect(weather).to be_a(DailyWeather)
  end

  it 'has attributes' do
    expect(weather.date).to eq("2022-03-05 12:00:00 -0700")
    expect(weather.sunrise).to eq("2022-03-05 06:27:07 -0700")
    expect(weather.sunset).to eq("2022-03-05 17:56:00 -0700")
    expect(weather.max_temp).to eq(123.45)
    expect(weather.min_temp).to eq(1.2345)
    expect(weather.conditions).to eq("Badass")
    expect(weather.icon).to eq("10d")
  end
end
