LMS.GameRoundRoute = Ember.Route.extend

  model: (params) ->
    game = @modelFor('game')
    game.get('season.rounds').findProperty('number', Number(params.round_number))

  setupController: (controller, round) ->
    controller.set('model', round)
    controller.set('rounds', @modelFor('game').get('season.rounds'))

  serialize: (round) ->
    {round_number: round.get('number')}
