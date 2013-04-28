LMS.Profile = DS.Model.extend
  name: DS.attr 'string'
  gravatarImageUrl: DS.attr 'string'

  gameParticipants: DS.hasMany('LMS.GameMembership')

  # games: (->
  #   @get('gameParticipants').getEach('game')
  # ).property('@eac.gameParticipants').cacheable()


#These will go very soon
LMS.Profile.FIXTURES = [

  {
    id: 1
    name: "Rob Monie"
    gravatarImageUrl: 'https://secure.gravatar.com/avatar/dbd74894a6b5adb9a7505b2e1cb38b36?s=80&d=404'
    gameParticipants: [1, 3]
  },
  {
    id: 2
    name: "Stu Liston"
    gravatarImageUrl: 'https://secure.gravatar.com/avatar/dae3715f6eae05308ff8bd57b1618b2b?s=80&d=404'
    gameParticipants: [2, 4]
  }

]
