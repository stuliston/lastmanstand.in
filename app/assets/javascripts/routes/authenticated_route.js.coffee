LMS.AuthenticatedRoute = Ember.Route.extend

  beforeModel: ->
    unless @controllerFor('currentUser').get('model')
      RSVP.reject()

  # error: (reason, reject) ->
  #   sessionController =
