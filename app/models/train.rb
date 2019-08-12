class Train < ApplicationRecord
  validates :number, presence: true

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, inverse_of: :trains

  has_and_belongs_to_many :routes
end
