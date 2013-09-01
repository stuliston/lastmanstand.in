LMS.AuthenticatedRoute = Ember.Route.extend

  beforeModel: ->
    throw "Not Authenticated" unless @controllerFor('currentUser').get('model')

  actions:
    error: (reason, transition) ->
      signInController = @controllerFor('signIn')
      signInController.set('afterSignInTransition', transition)
      @transitionTo('sign_in')
