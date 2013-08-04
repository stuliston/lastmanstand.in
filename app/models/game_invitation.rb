class GameInvitation < ActiveRecord::Base
  belongs_to :profile
  belongs_to :game
  belongs_to :invited_by, class_name: 'Profile', foreign_key: 'invited_by_id'
end