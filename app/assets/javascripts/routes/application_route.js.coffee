LMS.ApplicationRoute = Ember.Route.extend

  # model: ->
  #   Ember.Object.create(currentUser: LMS.User.find(currentUserId))

  setupController: (controller, model) ->
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
