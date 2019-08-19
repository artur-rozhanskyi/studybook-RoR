FactoryBot.define do
  factory :carriage do
    bottom_places { 26 }
    upper_places { 26 }
    carriage_type { create(:carriage_type) }
    train { create(:train) }
  end
end
