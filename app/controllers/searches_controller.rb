class SearchesController < ApplicationController
  def show
    if search_params[:starting] && search_params[:destination]
      @data = {results: result, starting: search_params[:starting], destination: search_params[:destination]}
    end
  end

  private

  def search_params
    params.permit(:starting, :destination)
  end

  def result
     RailwayStationsRoute.joins("JOIN railway_stations_routes as t on t.route_id = railway_stations_routes.route_id")
                         .where("t.railway_station_id = ?", search_params[:starting])
                         .where("railway_stations_routes.railway_station_id  = ?", search_params[:destination])
                         .where("railway_stations_routes.position > t.position")
  end
end
