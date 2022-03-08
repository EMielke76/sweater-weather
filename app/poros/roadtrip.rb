class Roadtrip
  attr_reader :travel_time,
              :start_city,
              :end_city,
              :end_lat,
              :end_long

  def initialize(attributes)
    @travel_time = attributes[:formattedTime]
    @start_city = attributes[:locations].first[:adminArea5] + ", " + attributes[:locations].first[:adminArea3]
    @end_city = attributes[:locations].second[:adminArea5] + ", " + attributes[:locations].second[:adminArea3]
    @end_lat = attributes[:locations].second[:latLng][:lat]
    @end_long = attributes[:locations].second[:latLng][:lng]
  end
end
