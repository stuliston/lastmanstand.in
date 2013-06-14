LMS.GameInvitation = DS.Model.extend

  game: DS.belongsTo 'LMS.Game'
  profile: DS.belongsTo 'LMS.Profile'
