#= require ./authenticated_route
LMS.GameInvitationsRoute = LMS.AuthenticatedRoute.extend

  setupController: (controller) ->
    controller.set('model', @controllerFor('currentUser').get('gameInvitations'))
    @controllerFor('application').set('pageTitle', "Your Invitations")