FactoryBot.define do
  factory :route do
    before(:create) { |r| 2.times { r.railway_stations << create(:railway_station) } }

    trait :with_train do
      before(:create) { |r| r.trains << create(:train) }
    end
  end
end
