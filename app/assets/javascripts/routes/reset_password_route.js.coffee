#= require ./public_route
LMS.ResetPasswordRoute = LMS.PublicRoute.extend

  model: ->
    Ember.Object.create(email: null)

  setupController: (controller, model) ->
    controller.set('model', model)
    @controllerFor('application').set('pageTitle', "Reset Password")
