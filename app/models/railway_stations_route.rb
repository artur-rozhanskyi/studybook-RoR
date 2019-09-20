class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route
  validates :railway_station_id, uniqueness: { scope: :route_id }

  before_save :station_position
  after_destroy :station_position

  def station_position
    write_attribute :position, route.railway_stations.find_index(railway_station)
  end
end
