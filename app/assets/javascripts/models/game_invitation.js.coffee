LMS.GameInvitation = DS.Model.extend

  game: DS.belongsTo 'LMS.Game'
  profile: DS.belongsTo 'LMS.Profile'
  email: DS.attr 'string'

  displayName: (->
    @get('profile.name') || @get('email')
  ).property('profile.name', 'email')
