class Api::V1::ForecastController < ApplicationController
before_action :validate_location, only: [:index]

  def index
    location = LocationFacade.get_lat_long(params[:location])
    json_response(ForecastSerializer.new(ForecastFacade.forecast(location.lat, location.long)))
  end
end
