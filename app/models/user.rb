class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile

  validates :email,     presence: true, uniqueness: true
  validates :password,  presence: true
end
