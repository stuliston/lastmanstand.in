LMS.CurrentProfileController = Ember.ObjectController.extend

  init: ->
    @_pollForInvitations()

  _pollForInvitations: ->
    @_invitationsPollId = setInterval(=>
      Ember.run =>
        $.getJSON("/api/profiles/#{@get('id')}/game_invitations").success (result) =>
          store = @get('store')
          store.adapterForType(LMS.GameInvitation).didFindMany(store, LMS.GameInvitation, result)
    , 60000)

  destroy: ->
    clearInterval(@_invitationsPollId)