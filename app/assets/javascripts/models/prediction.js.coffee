LMS.Prediction = DS.Model.extend
  fixture: DS.belongsTo('LMS.Fixture')
  profile: DS.belongsTo('LMS.Profile')
  team: DS.belongsTo('LMS.Team')