FactoryBot.define do
  factory :carriage, class: Carriage do
    bottom_places { 26 }
    upper_places { 26 }
    train
  end

  factory :coupe, class: CoupeCarriage do
    bottom_places { 26 }
    upper_places { 26 }
    train
  end
end
