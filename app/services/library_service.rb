class LibraryService

  def get_books(location, quantity)
    response = conn.get("/search.json?q=#{location}&limit=#{quantity}")
    body = parse_json(response)
  end

  private
  def conn
    Faraday.new(url: "https://openlibrary.org")
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
