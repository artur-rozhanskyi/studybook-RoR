class UpdateRailwayStation
  class << self
    def call(railway_station_id, params)
      station = RailwayStation.find railway_station_id
      update_station(station, params)
      station
    end

    private

    def update_station(station, params)
      [:position, :arrival, :departure].each do |item|
        binding.pry
        station.update_field(params[:route_id], item, params[item])
      end
    end
  end
end
