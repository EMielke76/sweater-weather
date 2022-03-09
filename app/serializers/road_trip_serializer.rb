class RoadTripSerializer
  class << self
    def serialize(adventure, weather)
      { data:
        { id: nil,
          type: 'roadtrip',
          attributes: {
                  start_city: adventure.start_city,
                  end_city: adventure.end_city,
                  travel_time: adventure.travel_time,
                  weather_at_eta: {
                    temperature: weather[adventure.travel_time.to_i].temperature,
                    conditions: weather[adventure.travel_time.to_i].conditions
                  }

                      }
        }
      }
    end
  end
end
