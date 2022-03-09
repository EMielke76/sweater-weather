class Api::V1::BackgroundsController < ApplicationController
before_action :validate_location, only: [:index]

  def index
    image = BackgroundFacade.get_image(params[:location])
    json_response(ImageSerializer.new(image))
  end
end
