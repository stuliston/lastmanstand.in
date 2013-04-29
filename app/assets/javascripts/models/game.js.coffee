LMS.Game = DS.Model.extend
  name: DS.attr 'string'
  gameMemberships: DS.hasMany('LMS.GameMembership')

  members: (->
    @get('gameMemberships').getEach('profile')
  ).property('@each.gameMemberships').cacheable()

