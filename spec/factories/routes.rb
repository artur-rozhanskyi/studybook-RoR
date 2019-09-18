FactoryBot.define do
  factory :route do
    before(:create) { |r| r.railway_stations << create_list(:railway_station, 2) }

    trait :with_train do
      before(:create) { |r| r.trains << create(:train) }
    end
  end
end
