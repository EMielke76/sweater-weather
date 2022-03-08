require 'rails_helper'

RSpec.describe LocationFacade do
  context 'instance methods' do
    describe '#get_lat_long' do
      it 'returns GeoLocation data', :vcr do
        location = "Denver,CO"
        results = LocationFacade.get_lat_long(location)

        expect(results).to be_a(GeoLocation)
      end
    end

    describe '#roadtrip' do
      context 'successful trip' do
        it 'returns Roadtrip data', :vcr do
          start = "New York,NY"
          finish = "Los Angeles,CA"
          results = LocationFacade.roadtrip(start, finish)

          expect(results).to be_a(Roadtrip)
        end
      end

      context 'unsuccessful trip' do
        it 'returns a hash if trip is impossible', :vcr do
          start = "Los Angeles,CA"
          finish = "London, UK"
          results = LocationFacade.roadtrip(start, finish)

          expect(results).to be_a(Hash)
          expect(results).to have_key(:origin)
          expect(results[:origin]).to eq(start)
          expect(results).to have_key(:end)
          expect(results[:end]).to eq(finish)
          expect(results).to have_key(:message)
          expect(results[:message]).to eq("Impossible Route")
        end
      end
    end
  end
end
