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
    # 1 version - Abc Metric - 19
    # types = CarriageType.all.find_each.with_object({}) { |obj, hsh| hsh[obj.id] = obj.name }
    # hsh = Hash.new { |hash, key| hash[key] = Hash.new(0) }
    # carriages.each do |carriage|
    #   hsh[types[carriage.carriage_type_id]][:upper_places] += carriage.upper_places
    #   hsh[types[carriage.carriage_type_id]][:bottom_places] += carriage.bottom_places
    # end
    # hsh

    # 2 version
    # result = ActiveRecord::Base.connection.execute("SELECT carriages.*, carriage_types.name FROM carriages
    #   INNER JOIN carriage_types ON carriage_types.id = carriages.carriage_type_id")
    # hsh = Hash.new { |hash, key| hash[key] = Hash.new(0) }
    # result.each do |element|
    #   hsh[element['name']][:bottom_places] += element['bottom_places']
    #   hsh[element['name']][:upper_places] += element['upper_places']
    # end
    # hsh
  end
end
