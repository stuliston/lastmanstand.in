class GameInvitation < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  belongs_to :invited_by, class_name: 'User', foreign_key: 'invited_by_id'
end