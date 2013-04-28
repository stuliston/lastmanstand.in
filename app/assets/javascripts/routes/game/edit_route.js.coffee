LMS.GameEditRoute = Ember.Route.extend

  model: (params)->
    @modelFor('game')

  setupController: (controller, game) ->
    controller.set('model', game)