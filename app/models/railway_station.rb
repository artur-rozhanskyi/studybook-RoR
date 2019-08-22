class RailwayStation < ApplicationRecord
  validates :name, presence: true

  has_many :trains, dependent: :nullify, foreign_key: 'current_station_id', inverse_of: :current_station
  has_many :railway_stations_routes, dependent: :delete_all
  has_many :routes, through: :railway_stations_routes
  has_many :tickets, dependent: :nullify, foreign_key: :first_station_id, inverse_of: :first_station
  has_many :tickets, dependent: :nullify, foreign_key: :last_station_id, inverse_of: :last_station
end
