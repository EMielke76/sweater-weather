class Api::V1::RoadTripController < ApplicationController

  def create
    adventure = LocationFacade.new.roadtrip(params[:origin], params[:destination])
    weather = ForecastFacade.new.roadtrip(adventure.end_lat, adventure.end_long)
    json_response(RoadtripSerializer.serialize(adventure, weather), :created)
  end
end
