class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email,     presence: true, uniqueness: true
  validates :password,  presence: true
  validates :name, presence: true

  has_many :game_memberships, dependent: :destroy
  has_many :games, through: :game_memberships
  has_many :game_invitations, dependent: :destroy
  has_many :predictions

  after_create do |user|
    invitations = GameInvitation.where(email: user.email)
    invitations.each do |invitation|
      invitation.update_attributes(user: user)
    end
  end

end
