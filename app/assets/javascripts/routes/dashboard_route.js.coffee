LMS.DashboardRoute = Ember.Route.extend

  model: ->
    console.log 'a'
    Ember.Object.create
      games: LMS.Game.find()
      invitations: LMS.GameInvitation.find()

  setupController: (controller, dashboard) ->
    controller.set('model', dashboard)