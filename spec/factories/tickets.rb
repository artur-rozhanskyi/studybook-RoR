FactoryBot.define do
  factory :ticket do
    train
    name { Faker::Name.unique.name }
    middle_name { Faker::Name.unique.name }
    last_name { Faker::Name.unique.name }
    passport { Faker::Name.unique.name }
    arrival { DateTime.now }
    departure { DateTime.now }

    before(:create) do |t|
      t.first_station = t.train.routes.first.railway_stations.first
      t.last_station = t.train.routes.first.railway_stations.last
    end
  end
end
