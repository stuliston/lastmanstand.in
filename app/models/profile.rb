class Profile < ActiveRecord::Base

  belongs_to :user
  has_many :game_memberships, dependent: :destroy
  has_many :games, through: :game_memberships

  delegate :email, to: :user

end
