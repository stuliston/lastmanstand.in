LMS.GameInvitation = DS.Model.extend

  email: DS.attr 'string'
  avatarImageUrl: DS.attr('string')

  game: DS.belongsTo 'LMS.Game'
  profile: DS.belongsTo 'LMS.Profile'

  displayName: (->
    @get('profile.name') || @get('email')
  ).property('profile.name', 'email')

  avatarImageUrlMedium: (->
    @get('avatarImageUrl') + "?s=40"
  ).property('avatarImageUrl')
