class BooksSerializer
  #include JSONAPI::Serializer
  class << self
    def serialize(data, location)
      { data:
        { id: nil,
          type: 'books',
          attributes: {
                  destination: location,
                  forecast: forecast(data),
                  total_books_found: data[:count],
                  books: data[:books]
                      }
        }
      }
    end

    def forecast(data)
      {
        summary: data[:weather].current_weather.conditions,
        temperature: data[:weather].current_weather.temperature.to_s + " F"
      }
    end
  end
end
