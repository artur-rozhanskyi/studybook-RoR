FactoryBot.define do
  factory :user do
    login { 'login@login.com' }
    password { 'password' }
  end
end
