class RailwayStation < ApplicationRecord
  validates :name, presence: true

  has_many :trains, dependent: :nullify, foreign_key: 'current_station_id', inverse_of: :current_station
  has_many :railway_stations_routes, dependent: :delete_all
  has_many :routes, through: :railway_stations_routes
  has_many :tickets, dependent: :nullify, foreign_key: :first_station_id, inverse_of: :first_station
  has_many :tickets, dependent: :nullify, foreign_key: :last_station_id, inverse_of: :last_station

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(position: position) if station_route
  end

  def update_arrival_time(route, arrival)
    binding.pry
    station_route = station_route(route)
    station_route.update(arrival: flatten_date_array(arrival)) if station_route
  end

  def update_departure_time(route, departure)
    station_route = station_route(route)
    station_route.update(departure: flatten_date_array(departure)) if station_route
  end

  def time_arrival_in(route)
    station_route = station_route(route)
    station_route.try(:arrival)
  end

  def time_departure_in(route)
    station_route = station_route(route)
    station_route.try(:departure)  
  end

  def position_in(route)
    station_route = station_route(route)
    station_route.try(:position)
  end

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end

  private

  def flatten_date_array hash
    %w(1 2 3 4 5).map { |e| hash["#{e}i"].to_i }
  end
end
