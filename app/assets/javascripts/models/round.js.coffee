LMS.Round = DS.Model.extend
  number: DS.attr('number')
  startTime: DS.attr('date')
  season: DS.belongsTo('LMS.Season')
  fixtures: DS.hasMany('LMS.Fixture')
