FactoryBot.define do
  factory :carriage, class: Carriage do
    bottom_places { 26 }
    upper_places { 26 }
    train
  end

  factory :coupe, class: CoupeCarriage do
    bottom_places { 26 }
    upper_places { 26 }
    trait :train do
      train
    end

    trait :train_with_carriages do
      before(:create) do |carriage|
        carriage.train = create(:train)
        carriage.train.carriages << create(:carriage)
      end
    end
  end
end
