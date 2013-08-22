class Round < ActiveRecord::Base
  belongs_to :season
  has_many :fixtures, dependent: :delete_all

  default_scope -> { order('number') }

   #This could be stored and maintained by after save hooks on fixtures if performance is a concern
  def start_time
    fixtures.map(&:start_time).min
  end

end