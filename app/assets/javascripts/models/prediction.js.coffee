LMS.Prediction = DS.Model.extend
  fixture: DS.belongsTo('LMS.Fixture')
  user: DS.belongsTo('LMS.User')
  team: DS.belongsTo('LMS.Team')
  game: DS.belongsTo('LMS.Game')

  isCorrect: (->
    @get('team') == @get('fixture.winningTeam')
  ).property('team', 'fixture.winningTeam')
