class SearchesController < ApplicationController
  def show
    return unless search_params[:starting] && search_params[:destination]

    @data = result_data
  end

  private

  def search_params
    params.permit(:starting, :destination)
  end

  def result
    queries = []
    query = RailwayStationsRoute.joins('JOIN railway_stations_routes as t
                                        on t.route_id = railway_stations_routes.route_id')
                                .where('t.railway_station_id' => search_params[:starting],
                                       'railway_stations_routes.railway_station_id' => search_params[:destination])
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

  def result_data
    @results = result
    @results.map(&:route_id).uniq.each.with_object(Hash.new { |h, k| h[k] = {} }) do |route, hsh|
      hsh[route][:departure] = train_time(route, search_params[:starting], :departure)
      hsh[route][:arrival] = train_time(route, search_params[:destination], :arrival)
      hsh[route][:starting] = search_params[:starting]
      hsh[route][:destination] = search_params[:destination]
    end
  end
end
