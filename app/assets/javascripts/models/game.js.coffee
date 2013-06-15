LMS.Game = DS.Model.extend
  name: DS.attr('string')
  league: DS.belongsTo('LMS.League')
  gameMemberships: DS.hasMany('LMS.GameMembership')
  gameInvitations: DS.hasMany('LMS.GameInvitation')
  maxAllowedPlayers: DS.attr('number', {defaultValue: 3, readOnly: true}) #readonly not currently implemented in ember data but coming https://github.com/emberjs/data/pull/303

  members: (->
    @get('gameMemberships').getEach('profile')
  ).property('@each.gameMemberships').cacheable()

  invitations: (->
    @get('gameInvitations').getEach('game')
  ).property('@each.gameInvitations').cacheable()

