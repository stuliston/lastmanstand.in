LMS.GameEditControllerMixin = Ember.Mixin.create
  # templateName: 'add_game_invitations'
  # classNames: ['add-game-invitations']
  newEmail: null
  needs: ['currentUser']
  currentUser: Ember.computed.alias('controllers.currentUser')

  isCurrentUserEmail: (->
    @get('currentUser.email') == @get('newEmail')
  ).property('newEmail')

  isExistingMemberEmail: (->
    email = @get('newEmail')
    @get('gameMemberships').someProperty('user.email', email)
  ).property('newEmail')

  isExistingInvitationEmail: (->
    email = @get('newEmail')
    @get('gameInvitations').someProperty('email', email)
  ).property('newEmail')

  isEmailTaken: Ember.computed.or('isExistingMemberEmail', 'isExistingInvitationEmail')

  isEmailInvalid: ( ->
    !LMS.EmailValidator.isValid(@get('newEmail')) || @get('isEmailTaken')
  ).property('newEmail')

  actions:
    onEnterKey: ->
      @send('addEmail')
    addEmail: ->
      return if @get('isEmailInvalid')
      game = @get('model')
      game.get('gameInvitations').createRecord(email: @get('newEmail'), invitedBy: @get('currentUser'))
      @set('newEmail', null)
