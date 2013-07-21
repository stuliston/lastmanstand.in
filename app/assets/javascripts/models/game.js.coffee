LMS.Game = DS.Model.extend

  name: DS.attr('string')
  maxAllowedPlayers: DS.attr('number', {defaultValue: 3, readOnly: true}) #readonly not currently implemented in ember data but coming https://github.com/emberjs/data/pull/303
  numberOfLives: DS.attr('number', {readOnly: true}) #readonly not currently implemented in ember data but coming https://github.com/emberjs/data/pull/303

  season: DS.belongsTo('LMS.Season')
  predictions: DS.hasMany('LMS.Prediction')
  gameMemberships: DS.hasMany('LMS.GameMembership')
  gameInvitations: DS.hasMany('LMS.GameInvitation')


  members: (->
    @get('gameMemberships').getEach('profile')
  ).property('@each.gameMemberships').cacheable()

  invitations: (->
    @get('gameInvitations').getEach('game')
  ).property('@each.gameInvitations').cacheable()

