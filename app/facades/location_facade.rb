class LocationFacade

  def get_lat_long(location)
    GeoLocation.new(service.get_lat_long(location)[:results].first[:locations].first[:latLng])
  end

  def roadtrip(start, finish)
    Roadtrip.new(service.roadtrip(start, finish)[:route])
  end

  private
  def service
    LocationService.new
  end
end
