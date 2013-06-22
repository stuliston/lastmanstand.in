LMS.GameRoundRoute = Ember.Route.extend
  model: (params) ->
    game = @modelFor('game')
    game.get('season.rounds').findProperty('number', Number(params.round_number))

  serialize: (round) ->
    {round_number: round.get('number')}
