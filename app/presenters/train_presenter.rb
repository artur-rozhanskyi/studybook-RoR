class TrainPresenter < BasePresenter
  def count_carraiage_types
    carriages.each_with_object(Hash.new(0)) do |carriage, hsh|
      hsh[carriage.type.remove('Carriage').downcase] += 1
    end
  end

  def sorted_carriage
    sort ? carriages_head : carriages_tail
  end

  def value_or_zero(value)
    value || 0
  end
end
