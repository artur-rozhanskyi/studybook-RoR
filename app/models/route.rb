class Route < ApplicationRecord
  validates :name, presence: true
  validates :railway_stations, number_of_stations: { minimum: 2 }

  has_many :railway_stations_routes, dependent: :delete_all
  has_many :railway_stations, -> { order('position') }, through: :railway_stations_routes
  has_and_belongs_to_many :trains

  before_validation :set_name

  private

  def set_name
    self[:name] = "#{railway_stations.first.name} - #{railway_stations.last.name}"
  end
end
