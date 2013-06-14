class Profile < ActiveRecord::Base

  belongs_to :user
  has_many :game_memberships, dependent: :destroy
  has_many :games, through: :game_memberships

  has_many :game_invitations, dependent: :destroy

  delegate :email, to: :user

end
