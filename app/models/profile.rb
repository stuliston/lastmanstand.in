class Profile < ActiveRecord::Base

  belongs_to :user
  has_many :game_memberships, dependent: :destroy
  has_many :games, through: :game_memberships
  has_many :game_invitations, dependent: :destroy
  has_many :predictions

  delegate :email, to: :user

  validates :name, presence: true

  after_create do |profile|
    invitations = GameInvitation.where(email: profile.user.email)
    invitations.each do |invitation|
      invitation.update_attributes(profile: profile)
    end
  end

end
