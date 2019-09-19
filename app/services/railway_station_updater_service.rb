module RailwayStationUpdaterService
  class << self
    def update_station_in_route(station, params)
      RailwayStationUpdater.call station[:id], params
    end
  end
end
