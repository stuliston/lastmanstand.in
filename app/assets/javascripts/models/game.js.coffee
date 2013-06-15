LMS.Game = DS.Model.extend
  name: DS.attr 'string'
  gameMemberships: DS.hasMany('LMS.GameMembership')
  gameInvitations: DS.hasMany('LMS.GameInvitation')
  maxAllowedPlayers: DS.attr 'number', {defaultValue: 3}

  members: (->
    @get('gameMemberships').getEach('profile')
  ).property('@each.gameMemberships').cacheable()

  invitations: (->
    @get('gameInvitations').getEach('game')
  ).property('@each.gameInvitations').cacheable()

