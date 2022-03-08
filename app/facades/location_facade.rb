class LocationFacade

  def get_lat_long(location)
    GeoLocation.new(service.get_lat_long(location)[:results].first[:locations].first[:latLng])
  end

  def roadtrip(start, finish)
    location = service.roadtrip(start, finish)
    if location[:route][:routeError][:errorCode] == -400
      Roadtrip.new(location[:route])
    else
      {origin: start, end: finish, message: "Impossible Route"}
    end
  end

  private
  def service
    LocationService.new
  end
end
