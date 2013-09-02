LMS.AuthenticatedRoute = Ember.Route.extend

  beforeModel: ->
    Ember.RSVP.reject(status: 401) unless @controllerFor('currentUser').get('model')

  actions:
    error: (reason, transition) ->
      if reason.status == 401
        signInController = @controllerFor('signIn')
        signInController.set('afterSignInTransition', transition)
        @transitionTo('sign_in')
      else if reason.status == 404
        @transitionTo('not_found')

NOT_AUTHENTICATED = 401