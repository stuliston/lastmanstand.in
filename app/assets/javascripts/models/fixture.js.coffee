LMS.Fixture = DS.Model.extend
  startTime: DS.attr('date')
  homeScore: DS.attr('number')
  awayScore: DS.attr('number')
  homeTeam: DS.belongsTo('LMS.Team')
  awayTeam: DS.belongsTo('LMS.Team')
  winningTeam: DS.belongsTo('LMS.Team')
  round: DS.belongsTo('LMS.Round')

  losingTeam: (->
    return unless @get('hasResult')
    winningTeam = @get('winningTeam')
    [@get('homeTeam'), @get('awayTeam')].without(winningTeam)[0]
  ).property('winningTeam', 'hasResult')

  hasResult: (->
    !!@get('winningTeam') #Add draw in later
  ).property('winningTeam')
