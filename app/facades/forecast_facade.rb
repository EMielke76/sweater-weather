class ForecastFacade

  def forecast(lat, long)
    cache = service.forecast(lat, long)
    current = CurrentWeather.new(cache[:current])
    daily = cache[:daily][0..4].map do |daily|
              DailyWeather.new(daily)
            end
    hourly = cache[:hourly][0..7].map do |hourly|
              HourlyWeather.new(hourly)
            end
    Forecast.new(current, daily, hourly)
  end

  def roadtrip(lat, long)
    service.roadtrip(lat, long)[:hourly].map do |weather_data|
      HourlyWeather.new(weather_data)
    end
  end

private
  def service
    ForecastService.new
  end
end
