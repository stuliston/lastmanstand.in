class League < ActiveRecord::Base
  has_many :seasons
  has_many :teams
  validates :name, presence: true, uniqueness: true

  def current_season
    seasons.order(:start_date).last
  end
end