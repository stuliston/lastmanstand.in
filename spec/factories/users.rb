# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'First Last'
    email 'user@gmail.com'
    password 'password'
    password_confirmation 'password'
  end
end
