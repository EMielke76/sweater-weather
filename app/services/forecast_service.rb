class ForecastService < Service
  
  def forecast(lat, long)
    response = conn.get("/data/2.5/onecall?lat=#{lat}&lon=#{long}&exclude=minutely,alerts&units=imperial")
    body = parse_json(response)
  end

  def roadtrip(lat, long)
    response = conn.get("/data/2.5/onecall?lat=#{lat}&lon=#{long}&exclude=current,minutely,daily,alerts&units=imperial")
    body = parse_json(response)
  end

  private
  def conn
    Faraday.new(url: "https://api.openweathermap.org") do |faraday|
      faraday.params['appid'] = ENV['weather_id']
    end
  end
end
