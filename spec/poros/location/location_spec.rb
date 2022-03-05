require 'rails_helper'

RSpec.describe Location do
let!(:attributes)  { { :latLng: {
    lat: 39.738453,
    lng: -104.984853
    }
  } }

let!(location) = Location.new(attributes)

  it 'exists' do
    expect(location).to be_a(Location)
  end

  it 'has attributes' do
    expect(location.lat).to eq(39.738453)
    expect(location.long).to eq(-104.984853)
  end
end
