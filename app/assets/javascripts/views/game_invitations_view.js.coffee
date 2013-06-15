LMS.GameInvitationsView = Ember.View.extend
  templateName: 'game_invitations'
  newEmail: null

  isEmailInvalid: ( ->
    email = @get('newEmail')
    !LMS.EmailValidator.isValid(email || "") || !!@get('controller.model.gameInvitations').findProperty('email', email)
  ).property('newEmail')

  addEmail: ->
    game = @get('controller.model')
    invitation = LMS.GameInvitation.createRecord(game: game, email: @get('newEmail'))
    game.get('gameInvitations').pushObject(invitation)
    @set('newEmail', null)
