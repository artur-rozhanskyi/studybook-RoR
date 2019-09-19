FactoryBot.define do
  factory :train do
    number { 'Number' }
    current_station { create(:railway_station) }

    trait :with_carriages do
      before(:create) { |train| train.carriages { create_list(:carriage, train: self) } }
    end

    trait :with_route do
      before(:create) { |train| train.routes = create_list(:route, 1) }
    end
  end
end
