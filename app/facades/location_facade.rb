class LocationFacade

  def get_lat_long(location)
    GeoLocation.new(service.get_lat_long(location)[:results].first[:locations].first[:latLng])
  end

  private
  def service
    LocationService.new
  end
end
