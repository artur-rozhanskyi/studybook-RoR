FactoryBot.define do
  factory :carriage do
    bottom_places { 26 }
    upper_places { 26 }
    type { 'ExpressCarriage' }
    train { create(:train) }
  end
end
