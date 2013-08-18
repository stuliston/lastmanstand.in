LMS.ApplicationRoute = Ember.Route.extend

  model: ->
    Ember.Object.create(currentUser: LMS.User.find(currentUserId))

  setupController: (controller, model) ->
    controller.set('model', model)
    @controllerFor('currentUser').set('model', model.get('currentUser')) #user id hacked into bootstrap html. fix later

  # events:
  #   error: (reason, transition) ->
  #     console.log reason
  #     @controller.set('errorMessage', reason.message)

  #     if reason.status == 401
  #       window.location.href = "/users/sign_in"
  #     else
  #       true # bubble the error
