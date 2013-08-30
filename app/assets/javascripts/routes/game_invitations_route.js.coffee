LMS.GameInvitationsRoute = Ember.Route.extend

  setupController: (controller) ->
    controller.set('model', @controllerFor('currentUser').get('gameInvitations'))
    @controllerFor('application').set('pageTitle', "Your Invitations")