FactoryBot.define do
  factory :ticket do
    train

    user

    trait :with_path do
      before(:create) do |t|
        t.train.routes = [create(:route)]
        t.first_station = t.train.routes.first.railway_stations.first
        t.last_station = t.train.routes.first.railway_stations.last
      end
    end
  end
end
