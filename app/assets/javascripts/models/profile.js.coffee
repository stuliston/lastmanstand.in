LMS.Profile = DS.Model.extend
  name: DS.attr 'string'
  avatarImageUrl: DS.attr 'string'

  gameMemberships: DS.hasMany('LMS.GameMembership')
