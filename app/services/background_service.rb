class BackgroundService

  def get_image(location)
    response = conn.get("search?query=City of #{location}&per_page=1")
    body = parse_json(response)
  end

  private
  def conn
    Faraday.new(url: "https://api.pexels.com/v1/") do |faraday|
      faraday.headers['Authorization'] = ENV['pexels']
    end
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
