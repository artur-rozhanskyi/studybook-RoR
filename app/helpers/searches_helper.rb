module SearchesHelper
  def station_list
    @list = RailwayStation.all.collect { |x| [x.name, x.id] }
  end

  def route_name(id)
    route(id).name
  end

  def trains(id)
    route(id).trains
  end

  def route(id)
    Route.find(id)
  end

  def find_railway_stations_route(route_id, station)
    RailwayStationsRoute.where(route_id: route_id, railway_station_id: station).first
  end
end
