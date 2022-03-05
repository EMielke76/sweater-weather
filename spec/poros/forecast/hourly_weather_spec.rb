require 'rails_helper'

RSpec.describe HourlyWeather do
  let!(:attributes) {
    {
      dt: 1646503200,
      temp: 123.45,
      weather: [{ description: "Badass",
                  icon: "10d"}]
    }
  }

  let!(:weather) { HourlyWeather.new(attributes) }

  it 'exists' do
    expect(weather).to be_a(HourlyWeather)
  end

  it 'has attributes' do
    expect(weather.time).to eq("11:00:00")
    expect(weather.temperature).to eq(123.45)
    expect(weather.conditions).to eq("Badass")
    expect(weather.icon).to eq("10d")
  end
end
