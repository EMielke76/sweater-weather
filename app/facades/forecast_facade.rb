class ForecastFacade
  class << self
    def forecast(lat, long)
      cache = service.forecast(lat, long)
      current = current_weather(cache[:current])
      daily = daily_weather(cache[:daily][0..4])
      hourly = hourly_weather(cache[:hourly][0..7])
      Forecast.new(current, daily, hourly)
    end

    def current_weather(attributes)
      CurrentWeather.new(attributes)
    end

    def daily_weather(attributes)
      attributes.map do |day|
        DailyWeather.new(day)
      end
    end

    def hourly_weather(attributes)
      attributes.map do |hour|
        HourlyWeather.new(hour)
      end
    end

    def roadtrip(lat, long)
      hourly_weather(service.roadtrip(lat, long)[:hourly])
    end

  private
    def service
      ForecastService.new
    end
  end
end
