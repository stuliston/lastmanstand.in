LMS.PublicRoute = Ember.Route.extend


  actions:
    willTransition: ->
      console.log 'a'
      currentUserController = @controllerFor('currentUser')
      gameMembershipsController = @controllerFor('navGameMemberships')
      predictionsController = @controllerFor('predictions')
      unless gameMembershipsController.get('model')
        gameMembershipsController.set('model', currentUserController.get('gameMemberships'))
      unless predictionsController.get('model')
        predictionsController.set('model', currentUserController.get('predictions'))

