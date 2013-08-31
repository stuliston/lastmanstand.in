LMS.SessionsNewRoute = Ember.Route.extend

  model: ->
    LMS.Session.createRecord()

  setupController: (controller, session) ->
    controller.set('model', session)
    @controllerFor('application').set('pageTitle', "Sign In")