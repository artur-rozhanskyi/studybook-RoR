class Train < ApplicationRecord
  validates :number, presence: true

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, inverse_of: :trains

  has_and_belongs_to_many :routes

  has_many :carriages, dependent: :nullify

  def count_carraiage_places
    query = 'type, SUM(bottom_places), SUM(upper_places), SUM(side_upper_places), SUM(side_bottom_places), SUM(seats)'
    carriages.group(:type).pluck(Arel.sql(query))
  end

  def carriages_head
    carriages.order(:number)
  end

  def carriages_tail
    carriages.order(number: :desc)
  end
end
