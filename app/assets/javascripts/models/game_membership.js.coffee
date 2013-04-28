LMS.GameMembership = DS.Model.extend

  game: DS.belongsTo 'LMS.Game'
  participant: DS.belongsTo 'LMS.Profile'

#These will go very soon
LMS.GameMembership.FIXTURES = [

  {
    id: 1
    game: 1
    participant: 1
  },
  {
    id: 2
    game: 1
    participant: 2
  },
  {
    id: 3
    game: 2
    participant: 1
  },
  {
    id: 4
    game: 2
    participant: 2
  }

]
