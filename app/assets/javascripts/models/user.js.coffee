LMS.User = DS.Model.extend
  name: DS.attr('string')
  email: DS.attr('string')
  avatarImageUrl: DS.attr('string')
  gameMemberships: DS.hasMany('LMS.GameMembership')
  gameInvitations: DS.hasMany('LMS.GameInvitation', inverse: 'user')
  gameInvitationsAsInviter: DS.hasMany('LMS.GameInvitation', inverse: 'invitedBy')
  predictions: DS.hasMany('LMS.Prediction')

  smallThumbAvatarImageUrl: (->
    @get('avatarImageUrl') + "?s=20"
  ).property('avatarImageUrl')

