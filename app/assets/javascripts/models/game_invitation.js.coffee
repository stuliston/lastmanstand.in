LMS.GameInvitation = DS.Model.extend

  email: DS.attr('string')
  avatarImageUrl: DS.attr('string')

  game: DS.belongsTo('LMS.Game')
  user: DS.belongsTo('LMS.User', inverse: 'gameInvitations')
  invitedBy: DS.belongsTo('LMS.User', inverse: 'gameInvitationsAsInviter')

  displayName: (->
    @get('user.name') || @get('email')
  ).property('user.name', 'email')

  avatarImageUrlMedium: (->
    @get('avatarImageUrl') + "?s=40"
  ).property('avatarImageUrl')
