class FindRailwayStationRoutes
  class << self
    def call(params)
      return {} unless params[:starting] && params[:destination]

      RailwayStationsRoute.find_by_sql(queries(params))
    end

    private

    def initial_query(params)
      query = double_table RailwayStationsRoute
      query = path query, params[:starting], params[:destination]
      query = by_position query
      query
    end

    def queries(params)
      [first_table(initial_query(params)), second_table(initial_query(params))].map(&:to_sql).join(' UNION ')
    end

    def double_table(scope)
      scope.joins('JOIN railway_stations_routes as t on t.route_id = railway_stations_routes.route_id')
    end

    def path(scope, starting = nil, destination = nil)
      starting ? scope.where('t.railway_station_id' => starting) : scope
      destination ? scope.where('railway_stations_routes.railway_station_id' => destination) : scope
    end

    def by_position(scope)
      scope.where('railway_stations_routes.position > t.position')
    end

    def first_table(query)
      query.select('railway_stations_routes.*')
    end

    def second_table(query)
      query.select('t.*')
    end
  end
end
