# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'user@gmail.com'
    password 'password'
    password_confirmation 'password'
    profile { FactoryGirl.build(:profile) }
  end
end
