class BackgroundFacade
  class << self
    def get_image(location)
      Image.new(service.get_image(location)[:photos].first)
    end

    private
    def service
      BackgroundService.new
    end
  end
end
