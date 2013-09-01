#= require ./public_route
LMS.SignUpRoute = LMS.PublicRoute.extend

  model: ->
    Ember.Object.create
      name: null
      email: null
      password: null
      passwordConfirmation: null

  setupController: (controller, user) ->
    controller.set('model', user)
    @controllerFor('application').set('pageTitle', "Sign Up")