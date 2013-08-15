# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :season do
    name '2013 Premiership Season'
    start_date { Date.today }
    end_date { Date.today + 6.months}
  end
end
