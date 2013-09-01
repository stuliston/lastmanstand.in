#= require ./public_route
LMS.SignInRoute = LMS.PublicRoute.extend

  model: ->
    Ember.Object.create(email: null, password: null)

  setupController: (controller, model) ->
    controller.set('model', model)
    @controllerFor('application').set('pageTitle', "Sign In")
