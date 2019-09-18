class RailwayStation < ApplicationRecord
  validates :name, presence: true

  has_many :trains, dependent: :nullify, foreign_key: 'current_station_id', inverse_of: :current_station
  has_many :railway_stations_routes, dependent: :delete_all
  has_many :routes, through: :railway_stations_routes
  has_many :tickets, dependent: :nullify, foreign_key: :first_station_id, inverse_of: :first_station
  has_many :tickets, dependent: :nullify, foreign_key: :last_station_id, inverse_of: :last_station

  def update_field(route, field, value)
    station_route = station_route route
    value = time_set(value) if [:arrival, :departure].include?(field)
    station_route&.update(field => value)
    station_route.errors.each { |f, message| errors.add(f, message) } unless station_route.errors.empty?
    station_route
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
