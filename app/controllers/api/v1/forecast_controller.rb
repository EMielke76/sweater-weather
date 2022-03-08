class Api::V1::ForecastController < ApplicationController
before_action :get_location, only: [:index]

  def index
    json_response(ForecastSerializer.new(ForecastFacade.forecast(@location.lat, @location.long)))
  end

  private
  def get_location
    @location = LocationFacade.get_lat_long(params[:location])
  end
end
