class TrainPresenter < BasePresenter
  def count_carraiage_types
    carriages.select(:type).group('type, train_id').count.transform_keys! { |key| key.remove('Carriage').downcase }
  end

  def sorted_carriage
    sort ? carriages_head : carriages_tail
  end

  def value_or_zero(value)
    value || 0
  end
end
