FactoryBot.define do
  factory :train do
    number { 'Number' }
    current_station { create(:railway_station) }
    # routes { [create(:route)] }
    carriages { [create(:carriage, train: self), create(:carriage, train: self)] }
  end
end
