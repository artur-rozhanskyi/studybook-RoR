module TrainsHelper
  def count_carraiage_types(train)
    train.carriages.each_with_object(Hash.new(0)) do |carriage, hsh|
      hsh[carriage.carriage_type.name] += 1
    end
  end

  def count_carraiage_places(train)
    train.carriages.each_with_object(upper_places: Hash.new(0), bottom_places: Hash.new(0)) do |carriage, hsh|
      hsh[:upper_places][carriage.carriage_type.name] += carriage.upper_places
      hsh[:bottom_places][carriage.carriage_type.name] += carriage.bottom_places
    end
  end
end
