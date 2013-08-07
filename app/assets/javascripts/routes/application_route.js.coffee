LMS.ApplicationRoute = Ember.Route.extend

  # beforeModel: ->

  model: ->
    Ember.Object.create(currentProfile: LMS.Profile.find(currentProfileId))

  setupController: (controller, model) ->
    controller.set('model', model)
    @controllerFor('currentProfile').set('model', model.get('currentProfile')) #profile id hacked into bootstrap html. fix later

  # events:
  #   error: (reason, transition) ->
  #     console.log reason
  #     @controller.set('errorMessage', reason.message)

  #     if reason.status == 401
  #       window.location.href = "/users/sign_in"
  #     else
  #       true # bubble the error
