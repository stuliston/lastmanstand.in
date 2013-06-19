class Season < ActiveRecord::Base

  #it's debatable whether we need start/end date or a name in here as they could be inferred but they're there for now.

  belongs_to :league
  has_many :rounds, :dependent => :delete_all

end