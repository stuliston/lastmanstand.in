LMS.Season = DS.Model.extend
  name: DS.attr('string')
  league: DS.belongsTo('LMS.League')
  rounds: DS.hasMany('LMS.Round')