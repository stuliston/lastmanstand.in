LMS.ApplicationRoute = Ember.Route.extend

  model: ->
    Ember.Object.create(currentUser: LMS.User.find(currentUserId))

  setupController: (controller, model) ->
    controller.set('model', model)
    @controllerFor('currentUser').set('model', model.get('currentUser'))
    @controllerFor('navGameMemberships').set('model', model.get('currentUser.gameMemberships'))
    @controllerFor('predictions').set('model', model.get('currentUser.predictions'))

  # events:
  #   error: (reason, transition) ->
  #     console.log reason
  #     @controller.set('errorMessage', reason.message)

  #     if reason.status == 401
  #       window.location.href = "/users/sign_in"
  #     else
  #       true # bubble the error
