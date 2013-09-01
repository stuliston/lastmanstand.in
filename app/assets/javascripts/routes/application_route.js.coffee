LMS.ApplicationRoute = Ember.Route.extend

  setupController: (controller, model) ->
    @populateControllers()

  #used by subclasses as well
  populateControllers: ->
    currentUserController = @controllerFor('currentUser')
    @controllerFor('navGameMemberships').set('model', currentUserController.get('gameMemberships'))
    @controllerFor('predictions').set('model', currentUserController.get('predictions'))

