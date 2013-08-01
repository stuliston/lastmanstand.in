class Season < ActiveRecord::Base

  belongs_to :competition
  has_many :rounds, :dependent => :delete_all

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

end