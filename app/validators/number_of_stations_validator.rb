class NumberOfStationsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    minimum_number = options.fetch(:minimum)
    if value.present? && minimum_number > value.size
      record.errors.add(:base, 'Route should contain at least 2 stations')
    end
  end
end
