class Train < ApplicationRecord
  validates :number, presence: true

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, inverse_of: :trains

  has_and_belongs_to_many :routes

  has_many :carriages, dependent: :nullify

  def count_carraiage_types
    carriages.each_with_object(Hash.new(0)) do |carriage, hsh|
      hsh[carriage.carriage_type.name] += 1
    end
  end

  def count_carraiage_places
    CarriageType.joins(:carriages)
                .where(carriages: { train_id: carriages })
                .group(:name)
                .pluck(Arel.sql('carriage_types.name, SUM(bottom_places), SUM(upper_places)'))
  end
end
