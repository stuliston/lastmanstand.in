LMS.GameIndexRoute = Ember.Route.extend

  model: (params)->
    # console.log @modelFor('game').get('participants').getEach('name')
    @modelFor('game')

  setupController: (controller, game) ->
    controller.set('model', game)