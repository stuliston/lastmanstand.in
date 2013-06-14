LMS.Profile = DS.Model.extend
  name: DS.attr('string')
  avatarImageUrl: DS.attr('string')
  gameMemberships: DS.hasMany('LMS.GameMembership')
  gameInvitations: DS.hasMany('LMS.GameInvitation')

  games: (->
    @get('gameMemberships').getEach('game')
  ).property('@each.gameMemberships').cacheable()


  invitations: (->
    @get('gameInvitations').getEach('game')
  ).property('@each.gameInvitations').cacheable()
