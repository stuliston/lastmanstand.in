LMS.CurrentUserController = Ember.ObjectController.extend

  init: ->
    @_super()
    @_pollForInvitations()


  isSignedIn: (->
    @get('content') && this.get('content').get('isLoaded');
  ).property('content.isLoaded')


  _pollForInvitations: ->
    @_invitationsPollId = setInterval(=>
      return unless @get('id')
      Ember.run =>
        $.getJSON("/api/users/#{@get('id')}/game_invitations").success (result) =>
          store = @get('store')
          store.adapterForType(LMS.GameInvitation).didFindMany(store, LMS.GameInvitation, result)
    , 60000)

  destroy: ->
    clearInterval(@_invitationsPollId)