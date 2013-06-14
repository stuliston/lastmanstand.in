class League < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
end