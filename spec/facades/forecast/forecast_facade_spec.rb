require 'rails_helper'

RSpec.describe ForecastFacade do
  context 'instance methods' do
    describe '#forecast' do
      it 'returns Forecast data', :vcr do
        lat = 39.738453
        long = -104.984853
        query = ForecastFacade.new
        results = query.forecast(lat, long)

        expect(results).to be_a(Forcast)
      end
    end
  end
end
