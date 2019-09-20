class Search
  class << self
    def call(params)
      return {} unless params[:starting] && params[:destination]

      result_data params
    end

    private

    def filtered_railway_station_route(params)
      FindRailwayStationRoutes.call params
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
      @results = filtered_railway_station_route params
      @results.pluck(:route_id).uniq.each.with_object(Hash.new { |h, k| h[k] = {} }) do |route, hsh|
        route_data(route, hsh, params)
      end
    end
  end
end
