LMS.GameMembership = DS.Model.extend

  game: DS.belongsTo 'LMS.Game'
  user: DS.belongsTo 'LMS.User'

