module TrainsHelper
  def count_carraiage_types(train)
    train.carriages.each_with_object({}) do |carriage, hsh|
      hsh[carriage.carriage_type.name] ||= 0
      hsh[carriage.carriage_type.name] += 1
    end
  end
end
