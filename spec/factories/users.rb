FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at { Time.zone.today }

    trait :admin do
      admin { true }
    end
  end
end
