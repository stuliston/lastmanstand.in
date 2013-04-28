class Profile < ActiveRecord::Base

  belongs_to :user
  has_and_belongs_to_many :games

  delegate :email, to: :user

end
