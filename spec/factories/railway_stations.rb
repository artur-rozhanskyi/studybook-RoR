FactoryBot.define do
  factory :railway_station do
    name { 'Station1' }

    trait :with_route do
      after(:create) do |s|
        routes = create_list(:route, 1)
        s.routes = routes
        s.railway_stations_routes.find_by(route: routes.first).position = 1
      end
    end
  end
end
