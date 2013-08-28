class Competition < ActiveRecord::Base
  has_many :seasons, dependent: :destroy
  has_many :teams, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  def current_season
    seasons.order(:start_date).last
  end

end