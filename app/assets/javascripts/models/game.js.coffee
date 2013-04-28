LMS.Game = DS.Model.extend
  name: DS.attr 'string'
  gameMemberships: DS.hasMany('LMS.GameMembership')

  # participants: (->
  #   @get('gameMemberships').getEach('participant')
  # ).property('@each.gameMemberships').cacheable()

LMS.Game.FIXTURES = [

  {
    id: 1
    name: "Hooroo"
    gameMemberships: [1, 2]
  },
  {
    id: 2
    name: "Last Man Standing"
    gameMemberships: [3, 4]
  }

]
