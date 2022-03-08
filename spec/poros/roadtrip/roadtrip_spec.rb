require 'rails_helper'

RSpec.describe Roadtrip do
  let!(:attributes) {
    {
      formattedTime: "40:16:00",
      locations: [
        {
          adminArea5: "New York",
          adminArea3: "NY"
        },
        {
          adminArea5: "Los Angeles",
          adminArea3: "CA",
          latLng: { lng: -118.243344, lat: 34.052238}
        }
        ]
    }
  }

  let!(:roadtrip) { Roadtrip.new(attributes) }

  it 'exists' do
    expect(roadtrip).to be_a(Roadtrip)
  end

  it 'has attributes' do
    expect(roadtrip.travel_time).to eq("40:16:00")
    expect(roadtrip.start_city).to eq("New York, NY")
    expect(roadtrip.end_city).to eq("Los Angeles, CA")
    expect(roadtrip.end_lat).to eq(34.052238)
    expect(roadtrip.end_long).to eq(-118.243344)
  end
end
