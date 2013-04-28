LMS.Profile = DS.Model.extend
  name: DS.attr 'string'
  gravatarImageUrl: DS.attr 'string'

  gameMemberships: DS.hasMany('LMS.GameMembership')

  # games: (->
  #   @get('gameMemberships').getEach('game')
  # ).property('@eac.gameMemberships').cacheable()

