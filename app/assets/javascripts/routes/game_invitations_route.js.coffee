LMS.GameInvitationsRoute = Ember.Route.extend

  setupController: (controller, gameInvitations) ->
    controller.set('model', gameInvitations)
    @controllerFor('application').set('pageTitle', "Your Invitations")