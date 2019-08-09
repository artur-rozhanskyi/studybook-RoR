class RailwayStation < ApplicationRecord
  validates :name, presence: true

  has_many :railway_stations_routes, dependent: :destroy
  has_many :routes, through: :railway_stations_routes
end
