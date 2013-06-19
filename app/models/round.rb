class Round < ActiveRecord::Base
  belongs_to :season
  has_many :fixtures, :dependent => :delete_all
end