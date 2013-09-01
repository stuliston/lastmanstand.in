#= require ../authenticated_route
LMS.GameEditRoute = LMS.AuthenticatedRoute.extend

  model: (params)->
    @modelFor('game')

  setupController: (controller, game) ->
    controller.set('model', game)
    @controllerFor('application').set('pageTitle', "Invite Your Friends")