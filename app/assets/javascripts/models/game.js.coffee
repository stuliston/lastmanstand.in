LMS.Game = DS.Model.extend
  name: DS.attr 'string'
  participants: DS.hasMany('LMS.Profile')


LMS.Game.FIXTURES = [

  {
    id: 1
    name: "Hooroo"
    participants: [1, 2]
  },
  {
    id: 2
    name: "Last Man Standing"
    participants: [1, 2]
  }

]





