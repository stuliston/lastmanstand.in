LMS.Game = DS.Model.extend
  name: DS.attr 'string'
  avatarSmall: DS.attr 'string'
  avatarLarge: DS.attr 'string'
  participants: DS.hasMany('LMS.Profile')


LMS.Game.FIXTURES = [

  {
    id: 1
    name: "Hooroo"
    avatarSmall: 'game_avatar_small.png'
    avatarLarge: 'game_avatar_large.png'
    games: [1, 2]
  },
  {
    id: 2
    name: "Last Man Standing"
    avatarSmall: 'game_avatar_small.png'
    avatarLarge: 'game_avatar_large.png'
    games: [1, 2]
  }

]





