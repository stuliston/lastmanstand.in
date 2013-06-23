LMS.Profile = DS.Model.extend
  name: DS.attr('string')
  avatarImageUrl: DS.attr('string')
  gameMemberships: DS.hasMany('LMS.GameMembership')
  gameInvitations: DS.hasMany('LMS.GameInvitation')
  predictions: DS.hasMany('LMS.Prediction')

  # currentGames: (->
  #   @get('gameMemberships').getEach('game')
  # ).property('@each.gameMemberships')#.cacheable()


  # invitedGames: (->
  #   @get('gameInvitations').getEach('game')
  # ).property('@each.gameInvitations')#.cacheable()
