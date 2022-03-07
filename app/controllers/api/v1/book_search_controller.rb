class Api::V1::BookSearchController < ApplicationController
  before_action :set_data, only: [:index]

  def index
    json_response(BooksSerializer.serialize(@data, params[:location]))
  end

  private
  def set_data
    location = LocationFacade.new.get_lat_long(params[:location])
    @data = {
      count: LibraryFacade.new.total_books_found(params[:location], params[:quantity]),
      books: LibraryFacade.new.make_books(params[:location], params[:quantity]),
      weather: ForecastFacade.new.forecast(location.lat, location.long)
    }
  end
end
