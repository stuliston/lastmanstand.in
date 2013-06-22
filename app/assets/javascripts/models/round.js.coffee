LMS.Round = DS.Model.extend
  number: DS.attr('number')
  season: DS.belongsTo('LMS.Season')
  fixtures: DS.hasMany('LMS.Fixture')

  startDate: (->
    @get('fixtures').mapProperty('startTime').get('firstObject')
  ).property('fixtures.length')
