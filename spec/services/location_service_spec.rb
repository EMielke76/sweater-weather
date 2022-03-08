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

    context '#roadtrip' do
      it 'returns travel data' do
        VCR.use_cassette('NY-to-LA') do
          start = "New York,NY"
          finish = "Los Angeles,CA"

          query = LocationService.new
          results = query.roadtrip(start, finish)

          xpect(result).to be_a(Hash)
          expect(result).to have_key(:route)
          expect(result[:route]).to be_a(Hash)

          route = result[:results]

          expect(route).to have_key(:formattedTime)
          expect(route[:formattedTime]).to be_a(String)

          expect(route).to have_key(:locations)
          expect(route[:locations]).to be_a(Array)
          expect(route[:locations].length).to eq(2)

          location = results[:locations].first

          expect(location).to have_key(:adminArea5)
          expect(location[:adminArea5]).to be_a(String)

          expect(location).to have_key(:adminArea3)
          expect(location[:adminArea3]).to be_a(String)

          expect(location).to have_key(:latLng)
          expect(location[:latLng]).to be_a(Hash)

          lat_long = location[:latLng]

          expect(lat_long).to have_key(:lat)
          expect(lat_long[:lat]).to be_a(Float)

          expect(lat_long).to have_key(:lng)
          expect(lat_long[:lng]).to be_a(Float)

          location = results[:locations].second

          expect(location).to have_key(:adminArea5)
          expect(location[:adminArea5]).to be_a(String)

          expect(location).to have_key(:adminArea3)
          expect(location[:adminArea3]).to be_a(String)

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
