class Search
  class << self
    def call(params)
      return {} unless params[:starting] && params[:destination]

      result_data params
    end

    private

    def result(params)
      queries = []
      query = RailwayStationsRoute.joins('JOIN railway_stations_routes as t
                                        on t.route_id = railway_stations_routes.route_id')
                                  .where('t.railway_station_id' => params[:starting],
                                         'railway_stations_routes.railway_station_id' => params[:destination])
                                  .where('railway_stations_routes.position > t.position')
      queries << query.select('railway_stations_routes.*')
      queries << query.select('t.*')
      sql_str = queries.map(&:to_sql).join(' UNION ')
      RailwayStationsRoute.find_by_sql(sql_str)
    end

    def train_time(route, station, method)
      record = @results.find { |row| row.railway_station_id == station.to_i && row.route_id == route }
      time = record.public_send(method).try(:time)
      time.try(:strftime, '%H:%M ') || 'Time not set'
    end

    def route_data(route, hsh, params)
      hsh[route] = { departure: train_time(route, params[:starting], :departure),
                     arrival: train_time(route, params[:destination], :arrival),
                     starting: params[:starting],
                     destination: params[:destination] }
      hsh
    end

    def result_data(params)
      @results = result params
      @results.pluck(:route_id).uniq.each.with_object(Hash.new { |h, k| h[k] = {} }) do |route, hsh|
        route_data(route, hsh, params)
      end
    end
  end
end
