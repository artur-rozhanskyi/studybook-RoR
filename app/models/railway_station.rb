class RailwayStation < ApplicationRecord
  validates :name, presence: true

  has_many :trains, dependent: :destroy, foreign_key: 'current_station_id', inverse_of: :current_station
  has_many :railway_stations_routes, dependent: :destroy
  has_many :routes, through: :railway_stations_routes
  has_many :tickets
end
