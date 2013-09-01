#= require ../public_route
LMS.UsersNewRoute = LMS.PublicRoute.extend

  #Don't us a real user here because we don't want to poulate with password
  model: ->
    Ember.Object.create
      name: null
      email: null
      password: null
      passwordConfirmation: null

  setupController: (controller, user) ->
    controller.set('model', user)
    @controllerFor('application').set('pageTitle', "Sign Up")