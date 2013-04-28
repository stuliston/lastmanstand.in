LMS.Profile = DS.Model.extend
  name: DS.attr 'string'
  gravatarImageUrl: DS.attr 'string'
  games: DS.hasMany 'LMS.Game'


#These will go very soon
LMS.Profile.FIXTURES = [

  {
    id: 1
    name: "Rob Monie"
    gravatarImageUrl: 'https://secure.gravatar.com/avatar/dbd74894a6b5adb9a7505b2e1cb38b36?s=80&d=404'
    games: [1, 2]
  },
  {
    id: 2
    name: "Stu Liston"
    gravatarImageUrl: 'https://secure.gravatar.com/avatar/dae3715f6eae05308ff8bd57b1618b2b?s=80&d=404'
    games: [1, 2]
  }

]

