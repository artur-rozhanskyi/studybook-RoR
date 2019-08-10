FactoryBot.define do
  factory :train do
    number { 'qwerty' }
    current_station { create(:railway_station) }
    route { create(:route) }
  end
end
