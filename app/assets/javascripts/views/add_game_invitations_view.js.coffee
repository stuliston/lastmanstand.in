LMS.AddGameInvitationsView = Ember.View.extend
  templateName: 'add_game_invitations'
  newEmail: null
  classNames: ['add-game-invitations']
  currentUser: null

  isEmailInvalid: ( ->
    email = @get('newEmail')
    !LMS.EmailValidator.isValid(email || "") || @get('controller.model.gameInvitations').someProperty('email', email) || @get('isCurrentUserEmail')
  ).property('newEmail')

  isCurrentUserEmail: (->
    @get('currentUser.email') == @get('newEmail')
  ).property('newEmail')

  actions:
    addEmail: ->
      game = @get('controller.model')
      game.get('gameInvitations').createRecord(email: @get('newEmail'), invitedBy: @get('currentUser'))
      @set('newEmail', null)
