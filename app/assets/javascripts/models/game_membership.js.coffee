LMS.GameMembership = DS.Model.extend

  game: DS.belongsTo 'LMS.Game'
  membership: DS.belongsTo 'LMS.Profile'
