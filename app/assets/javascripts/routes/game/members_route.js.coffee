LMS.GameMembersRoute = Ember.Route.extend

  model: ->
    @modelFor('game').get('gameMemberships')

  setupController: (controller, memberships) ->
    controller.set('model', memberships)
    controller.set('gameInvitations', @modelFor('game').get('gameInvitations'))
