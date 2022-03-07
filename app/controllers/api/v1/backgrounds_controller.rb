class Api::V1::BackgroundsController < ApplicationController
  before_action :get_image, only: [:index]

  def index
    json_response(ImageSerializer.new(@image))
  end

  private
  def get_image
    @image = BackgroundFacade.new.get_image(params[:location])
  end
end
