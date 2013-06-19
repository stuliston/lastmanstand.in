class Prediction < ActiveRecord::Base
  belongs_to :fixture
  belongs_to :profile
  belongs_to :team
end