class SearchesController < ApplicationController
  def show
    if search_params[:starting] && search_params[:destination]
      @results = result
      @data = Hash.new { |h,k| h[k] = {} }
      @results.map(&:route_id).uniq.each do |route|
        @data[route][:departure] = train_time(route, search_params[:starting]).departure
        @data[route][:arrival] = train_time(route, search_params[:destination]).arrival
        @data[route][:starting] = search_params[:starting]
        @data[route][:destination] = search_params[:destination]
      end
      @data
    end
  end

  private

  def search_params
    params.permit(:starting, :destination)
  end

  def result
    queries = []
    query = RailwayStationsRoute.joins("JOIN railway_stations_routes as t on t.route_id = railway_stations_routes.route_id")
                .where("t.railway_station_id" => search_params[:starting],
                       "railway_stations_routes.railway_station_id" => search_params[:destination])
                .where("railway_stations_routes.position > t.position")
    queries << query.select("railway_stations_routes.*")
    queries << query.select("t.*")
    sql_str = queries.map(&:to_sql).join(" UNION ")
    RailwayStationsRoute.find_by_sql(sql_str)
  end

  def train_time(route, station)
    @results.find{ |row| row.railway_station_id = route && row.route_id = route }
  end
end
