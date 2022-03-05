class HourlyWeather
  attr_reader :time,
              :temperature,
              :conditions,
              :icon

  def initialize(attributes)
    @time = Time.at(attributes[:dt]).to_s
    @temperature = attributes[:temp]
    @conditions = attributes[:weather][:description]
    @icon = attributes[:weather][:icon]
  end
end
