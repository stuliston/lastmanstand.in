#= require ../authenticated_route
LMS.GameMembersRoute = LMS.AuthenticatedRoute.extend

  model: ->
    @modelFor('game').get('gameMemberships')

  setupController: (controller, memberships) ->
    controller.set('model', memberships)
    controller.set('gameInvitations', @modelFor('game').get('gameInvitations'))
    @controllerFor('application').set('pageTitle', @modelFor('game').get('name'))
