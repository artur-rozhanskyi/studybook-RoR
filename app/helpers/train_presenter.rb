class TrainPresenter < BasePresenter
  def count_carraiage_types
    carriages.each_with_object(Hash.new(0)) do |carriage, hsh|
      hsh[carriage.carriage_type.name] += 1
    end
  end
end