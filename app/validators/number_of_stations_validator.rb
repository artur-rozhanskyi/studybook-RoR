class NumberOfStationsValidator < ActiveModel::EachValidator
  def validate_each(record, _attribute, value)
    minimum_number = options.fetch(:minimum)
    return unless value.present? && minimum_number > value.size

    record.errors.add(:base, 'Route should contain at least 2 stations')
  end
end
