class Train < ApplicationRecord
  validates :number, presence: true

  belongs_to :current_station,
             class_name: 'RailwayStation',
             foreign_key: :current_station_id,
             optional: true,
             inverse_of: :trains
end
