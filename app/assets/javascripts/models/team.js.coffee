LMS.Team = DS.Model.extend
  name: DS.attr('string')
  league: DS.belongsTo('LMS.League')