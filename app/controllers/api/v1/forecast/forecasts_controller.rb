class Api::V1::ForecastsController

  def index
    location = LocationFacade.new.get_lat_long(params[:location])
  end
end
