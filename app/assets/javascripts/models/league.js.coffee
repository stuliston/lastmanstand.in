LMS.League = DS.Model.extend
  name: DS.attr 'string'
  seasons: DS.hasMany('LMS.Season')
  currentSeason: DS.belongsTo('LMS.Season')