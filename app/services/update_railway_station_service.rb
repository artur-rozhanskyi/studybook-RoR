module UpdateRailwayStationService
  class << self
    def update_station(ctx, params)
      UpdateRailwayStation.call ctx[:id], params
    end
  end
end
