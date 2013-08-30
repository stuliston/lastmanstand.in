LMS.GameRoundsRoute = Ember.Route.extend

  model: ->
    @modelFor('game').get('season.rounds')
