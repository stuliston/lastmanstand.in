#= require ./public_route
LMS.ChangePasswordRoute = LMS.PublicRoute.extend

  model: (params)->
    Ember.Object.create
      resetPasswordToken: params.reset_password_token
      password: null
      passwordConfirmation: null

  setupController: (controller, user) ->
    controller.set('model', user)
    @controllerFor('application').set('pageTitle', "Change Password")

