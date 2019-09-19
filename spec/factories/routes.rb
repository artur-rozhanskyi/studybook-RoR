FactoryBot.define do
  factory :route do
    before(:create) { |r| r.railway_stations << create_list(:railway_station, 2) }

    trait :search do
      after(:create) do |r|
        r.railway_stations_routes.each_with_index do |row, i|
          row.position = i + 1
          row.save
        end
      end
    end

    trait :with_train do
      before(:create) { |r| r.trains << create(:train) }
    end
  end
end
