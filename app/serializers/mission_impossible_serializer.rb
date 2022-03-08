class MissionImpossibleSerializer
  class << self
    def serialize(adventure)
      { data:
        { id: nil,
          type: 'roadtrip',
          attributes: {
                  start_city: adventure[:origin],
                  end_city: adventure[:end],
                  travel_time: adventure[:message],
                  weather_at_eta: {
                    temperature: "",
                    conditions: ""
                  }

                      }
        }
      }
    end
  end
end
