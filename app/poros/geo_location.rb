class GeoLocation
  attr_reader :lat,
              :long

  def initialize(attributes)
    @lat = attributes[:lat]
    @long = attributes[:lng]
  end
end
