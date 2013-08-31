LMS.AddGameInvitationsView = Ember.View.extend
  templateName: 'add_game_invitations'
  classNames: ['add-game-invitations']
  newEmail: null
  currentUser: null

  isCurrentUserEmail: (->
    @get('currentUser.email') == @get('newEmail')
  ).property('newEmail')

  isExistingMemberEmail: (->
    email = @get('newEmail')
    @get('controller.model.gameMemberships').someProperty('user.email', email)
  ).property('newEmail')

  isExistingInvitationEmail: (->
    email = @get('newEmail')
    @get('controller.model.gameInvitations').someProperty('email', email)
  ).property('newEmail')

  isEmailTaken: Ember.computed.or('isExistingMemberEmail', 'isExistingInvitationEmail')

  isEmailInvalid: ( ->
    email = @get('newEmail')
    !LMS.EmailValidator.isValid(email || "") || @get('isEmailTaken')
  ).property('newEmail')

  actions:
    addEmail: ->
      game = @get('controller.model')
      game.get('gameInvitations').createRecord(email: @get('newEmail'), invitedBy: @get('currentUser'))
      @set('newEmail', null)
