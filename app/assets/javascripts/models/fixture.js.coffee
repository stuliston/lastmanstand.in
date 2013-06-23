LMS.Fixture = DS.Model.extend
  startTime: DS.attr('date')
  homeTeam: DS.belongsTo('LMS.Team')
  awayTeam: DS.belongsTo('LMS.Team')
  round: DS.belongsTo('LMS.Round')
  currentUserPredictions: DS.hasMany('LMS.Prediction') #hasMany so client won't try to send back to server when it changes
