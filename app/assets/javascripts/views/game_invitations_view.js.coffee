LMS.GameInvitationsView = Ember.View.extend
  templateName: 'game_invitations'
  newEmail: null
  classNames: ['game-invitations']

  isEmailInvalid: ( ->
    email = @get('newEmail')
    !LMS.EmailValidator.isValid(email || "") || !!@get('controller.model.gameInvitations').findProperty('email', email)
  ).property('newEmail')

  addEmail: ->
    game = @get('controller.model')
    game.get('gameInvitations').createRecord(email: @get('newEmail'))
    @set('newEmail', null)
