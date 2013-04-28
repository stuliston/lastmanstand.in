LMS.Game = DS.Model.extend
  name: DS.attr 'string'
  gameParticipants: DS.hasMany('LMS.GameParticipant')

  # participants: (->
  #   @get('gameParticipants').getEach('participant')
  # ).property('@each.gameParticipants').cacheable()

LMS.Game.FIXTURES = [

  {
    id: 1
    name: "Hooroo"
    gameParticipants: [1, 2]
  },
  {
    id: 2
    name: "Last Man Standing"
    gameParticipants: [3, 4]
  }

]





