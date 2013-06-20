LMS.Team = DS.Model.extend
  name: DS.attr('name')
  league: DS.belongsTo('LMS.League')