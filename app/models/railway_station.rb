class RailwayStation < ApplicationRecord
  validates :name, presence: true

  has_many :trains, dependent: :nullify, foreign_key: 'current_station_id', inverse_of: :current_station
  has_many :railway_stations_routes, dependent: :delete_all
  has_many :routes, through: :railway_stations_routes
  has_many :tickets, dependent: :nullify, foreign_key: :first_station_id, inverse_of: :first_station
  has_many :tickets, dependent: :nullify, foreign_key: :last_station_id, inverse_of: :last_station

  def update_position(route, position)
    station_route = station_route route
    station_route&.update(position: position)
  end

  def update_time(route, time, method)
    station_route = station_route route
    station_route&.update(method => time_set(time))
  end

  def time_in(route, method)
    station_route = station_route route
    station_route.try(method) || Time.zone.now
  end

  def position_in(route)
    station_route = station_route route
    station_route.try(:position)
  end

  def station_route(route)
    @station_route ||= railway_stations_routes.find_by(route: route)
  end

  private

  def time_set(hash)
    date = [hash[:year], hash[:month], hash[:day], hash[:hour], hash[:minute]]
    DateTime.strptime(date.join('/'), '%Y/%m/%d/%H/%M')
  end
end
