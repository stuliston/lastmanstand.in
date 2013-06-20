class League < ActiveRecord::Base
  has_many :seasons
  validates :name, presence: true, uniqueness: true
end