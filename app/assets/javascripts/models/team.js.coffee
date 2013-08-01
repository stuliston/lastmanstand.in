LMS.Team = DS.Model.extend
  name: DS.attr('string')
  competition: DS.belongsTo('LMS.Competition')