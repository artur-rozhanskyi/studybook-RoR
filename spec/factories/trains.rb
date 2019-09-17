FactoryBot.define do
  factory :train do
    number { 'Number' }
    current_station { create(:railway_station) }
    routes { [create(:route)] }

    trait :with_carriages do
      before(:create) { |train| train.carriages << [create(:carriage, train: self), create(:carriage, train: self)] }
    end
  end
end
