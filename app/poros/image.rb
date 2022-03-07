class Image
  attr_reader :id,
              :url,
              :photographer,
              :photographer_url

  def initialize(attributes)
    @id = nil
    @url = attributes[:url]
    @photographer = attributes[:photographer]
    @photographer_url = attributes[:photographer_url]
  end
end
