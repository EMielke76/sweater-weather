class BooksSerializer
  #include JSONAPI::Serializer
  class << self
    def serialize(data, location)
      require "pry"; binding.pry
      { data: {
              id: nil,
              type: 'books',
              attributes: {
                  destination: location,
                  forecast: forecast(data),
                  total_books_found: data[:count],
                  books: data[:book]
                          }
              }
      }
    end

    def forecast(data)
      {
        summary: data[:weather].first.conditions,
        temperature: data[:weather].first.temperature
      }
    end
  end
end
