FactoryBot.define do
  factory :railway_station do
    name { 'Station1' }

    trait :with_route do
      after(:create) { |s| s.routes << create(:route) }
    end
  end
end
