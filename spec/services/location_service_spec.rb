require 'rails_helper'

RSpec.describe LocationService do
  context 'instance methods' do
    context '#get_lat_long' do
      it 'returns location data' do
        VCR.use_cassette('denver-lat-long') do
          location = "Denver,CO"
          query = LocationService.new
          result = query.get_lat_long(location)

          expect(result).to be_a(Hash)
          expect(result).to have_key(:results)
          expect(result[:results]).to be_a(Array)
          expect(result[:results].first).to be_a(Hash)

          results = result[:results].first

          expect(results). to have_key(:locations)
          expect(results[:locations]).to be_a(Array)
          expect(results[:locations].first).to be_a(Hash)

          location = results[:locations].first

          expect(location).to have_key(:latLng)
          expect(location[:latLng]).to be_a(Hash)

          lat_long = location[:latLng]

          expect(lat_long).to have_key(:lat)
          expect(lat_long[:lat]).to be_a(Float)

          expect(lat_long).to have_key(:lng)
          expect(lat_long[:lng]).to be_a(Float)
        end
      end
    end
  end
end
