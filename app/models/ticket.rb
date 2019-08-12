class Ticket < ApplicationRecord
  belongs_to :train

  belongs_to :first_station, class_name: 'RailwayStation', foreign_key: :first_station_id, inverse_of: :tickets
  belongs_to :last_station, class_name: 'RailwayStation', foreign_key: :last_station_id, inverse_of: :tickets
end
