FactoryBot.define do
  factory :route do
    before(:create) { |r| 2.times { r.railway_stations << create(:railway_station) } }
  end
end
