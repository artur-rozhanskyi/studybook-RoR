class SearchesController < ApplicationController
  def show
    binding.pry
  end
  
  def trains(start, destination)
    # RailwayStationsRoute.joins(:route).where(railway_station:  [1, 2])

    # Route.joins(routes: :railway_stations).where("railway_stations_routes.railway_station_id", 1).select("route.name").where("railway_stations_routes.railway_station_id", 2).select("route.name")
  end

end
