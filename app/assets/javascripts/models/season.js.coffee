LMS.Season = DS.Model.extend
  name: DS.attr('string')
  competition: DS.belongsTo('LMS.Competition')
  rounds: DS.hasMany('LMS.Round')