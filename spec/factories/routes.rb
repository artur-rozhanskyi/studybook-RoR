FactoryBot.define do
  factory :route do
    name { 'Route1' }

    trait :with_railway_station do
      after(:create) { |r| r.railway_stations << create(:railway_station) }
    end
  end
end
