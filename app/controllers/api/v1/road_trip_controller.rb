class Api::V1::RoadTripController < ApplicationController
  before_action :restrict_access, only: [:create]

  def create
    adventure = LocationFacade.roadtrip(params[:origin], params[:destination])
    if adventure.class == Hash
      json_response(MissionImpossibleSerializer.serialize(adventure), :created)
    else
      weather = ForecastFacade.roadtrip(adventure.end_lat, adventure.end_long)
      json_response(RoadtripSerializer.serialize(adventure, weather), :created)
    end
  end
end
