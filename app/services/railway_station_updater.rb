class RailwayStationUpdater
  class << self
    def call(railway_station, params)
      update_station(railway_station, params)
      railway_station
    end

    private

    def update_station(station, params)
      [:position, :arrival, :departure].each do |item|
        station.update_field(params[:route_id], item, params[item]) if params[item]
      end
    end
  end
end
