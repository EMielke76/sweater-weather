require 'rails_helper'

RSpec.describe LocationFacade do
  context 'instance methods' do
    describe '#get_lat_long' do
      it 'returns GeoLocation data', :vcr do
        location = "Denver,CO"

        query = LocationFacade.new
        results = query.get_lat_long(location)

        expect(results).to be_a(GeoLocation)
      end
    end

    describe '#roadtrip' do
      it 'returns Roadtrip data', :vcr do
        start = "New York,NY"
        finish = "Los Angeles,CA"

        query = LocationFacade.new
        results = query.roadtrip(start, finish)

        expect(results).to be_a(Roadtrip)
      end
    end
  end
end
