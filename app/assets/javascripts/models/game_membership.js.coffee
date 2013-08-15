LMS.GameMembership = DS.Model.extend

  game: DS.belongsTo 'LMS.Game'
  user: DS.belongsTo 'LMS.User'
  lostLives: DS.attr('number')

  isOutOfLives: (->
    @get('lostLives') >= @get('game.numberOfLives')
  ).property('game.numberOfLives', 'lostLives')

