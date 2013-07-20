LMS.Fixture = DS.Model.extend
  startTime: DS.attr('date')
  homeScore: DS.attr('number')
  awayScore: DS.attr('number')
  homeTeam: DS.belongsTo('LMS.Team')
  awayTeam: DS.belongsTo('LMS.Team')
  winningTeam: DS.belongsTo('LMS.Team')
  round: DS.belongsTo('LMS.Round')
