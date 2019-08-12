FactoryBot.define do
  factory :train do
    number { 'Number' }
    current_station { create(:railway_station) }
    routes { [create(:route)] }
  end
end
