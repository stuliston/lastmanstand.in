LMS.ApplicationRoute = Ember.Route.extend

  setupController: (controller, model) ->
    @populateControllers()


  populateControllers: ->
    currentUserController = @controllerFor('currentUser')
    @controllerFor('navGameMemberships').set('model', currentUserController.get('gameMemberships'))
    @controllerFor('predictions').set('model', currentUserController.get('predictions'))

  # events:
  #   error: (reason, transition) ->
  #     console.log reason
  #     @controller.set('errorMessage', reason.message)

  #     if reason.status == 401
  #       window.location.href = "/users/sign_in"
  #     else
  #       true # bubble the error
