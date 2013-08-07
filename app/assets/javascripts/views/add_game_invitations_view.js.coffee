LMS.AddGameInvitationsView = Ember.View.extend
  templateName: 'add_game_invitations'
  newEmail: null
  classNames: ['add-game-invitations']
  currentProfile: null

  isEmailInvalid: ( ->
    email = @get('newEmail')
    !LMS.EmailValidator.isValid(email || "") || @get('controller.model.gameInvitations').someProperty('email', email) || @get('isCurrentProfileEmail')
  ).property('newEmail')

  isCurrentProfileEmail: (->
    @get('currentProfile.email') == @get('newEmail')
  ).property('newEmail')

  addEmail: ->
    game = @get('controller.model')
    game.get('gameInvitations').createRecord(email: @get('newEmail'), invitedBy: @get('currentProfile'))
    @set('newEmail', null)
