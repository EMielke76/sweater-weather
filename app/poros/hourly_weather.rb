class HourlyWeather
  attr_reader :time,
              :temperature,
              :conditions,
              :icon

  def initialize(attributes)
    @time = Time.at(attributes[:dt]).strftime("%I:%M:%S")
    @temperature = attributes[:temp]
    @conditions = attributes[:weather].first[:description]
    @icon = attributes[:weather].first[:icon]
  end
end
