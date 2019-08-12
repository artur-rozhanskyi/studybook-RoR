FactoryBot.define do
  factory :train do
    number { 'qwerty' }
    current_station { create(:railway_station) }
    route
  end
end
