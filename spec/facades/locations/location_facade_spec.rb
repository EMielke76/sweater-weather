require 'rails_helper'

RSpec.describe LocationFacade do
  context 'instance methods' do
    describe '#get_lat_long' do
      it 'returns GeoLocation data', :vcr do
        location = "Denver,CO"
        query = LocationFacade.new
        results = query.get_lat_long(location)
        require "pry"; binding.pry
        expect(results).to be_a(GeoLocation)
      end
    end
  end
end
