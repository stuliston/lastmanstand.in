LMS.Game = DS.Model.extend
  name: DS.attr 'string'
  gameMemberships: DS.hasMany('LMS.GameMembership')

  # participants: (->
  #   @get('gameMemberships').getEach('participant')
  # ).property('@each.gameMemberships').cacheable()

