class Profile < ActiveRecord::Base

  belongs_to :user

  delegate :email, to: :user

end
