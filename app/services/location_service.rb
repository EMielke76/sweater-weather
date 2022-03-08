class LocationService

  def get_lat_long(location)
    response = conn.get("geocoding/v1/address?location=#{location}")
    body = parse_json(response)
  end

  def roadtrip(start, finish)
    response = conn.get("directions/v2/route?from=#{start}&to=#{finish}")
    body = parse_json(response)
  end

  private
  def conn
    Faraday.new(url: "http://www.mapquestapi.com") do |faraday|
      faraday.params['key'] = ENV['mapquest_id']
    end
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
