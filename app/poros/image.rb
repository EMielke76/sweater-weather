class Image
  attr_reader :url,
              :photographer,
              :photographer_url

  def initialize(attributes)
    @url = attributes[:url]
    @photographer = attributes[:photographer]
    @photographer_url = attributes[:photographer_url]
  end 
end
