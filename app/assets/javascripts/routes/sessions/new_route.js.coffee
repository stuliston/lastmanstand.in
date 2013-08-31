LMS.SessionsNewRoute = LMS.PublicRoute.extend

  model: ->
    LMS.Session.createRecord()

  setupController: (controller, session) ->
    controller.set('model', session)
    @controllerFor('application').set('pageTitle', "Sign In")

  actions:
    willTransition: ->
      @get('currentModel')?.deleteRecord()