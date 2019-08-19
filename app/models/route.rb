class Route < ApplicationRecord
  validates :name, presence: true

  has_many :railway_stations_routes, dependent: :nullify
  has_many :railway_stations, through: :railway_stations_routes
  has_and_belongs_to_many :trains

  before_validation :set_name, :stations_count

  private

  def set_name
    self.name = "#{railway_stations.first.name} - #{railway_stations.last.name}"
  end

  def stations_count
    errors.add(:base, 'Route should contain at least 2 stations') if railway_stations.size < 2
  end
end
