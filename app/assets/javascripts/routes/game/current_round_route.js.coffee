LMS.GameCurrentRoundRoute = Ember.Route.extend

  model: ->
    now = new XDate()
    rounds = @modelFor('game').get('season.rounds')
    #What should the rules be for this ?? Tues - Mon?
    rounds.find((round) ->
      start = new XDate(round.get('startTime'))
      diffDays = now.diffDays(start)
      diffDays > -3 && diffDays <= 4
    )

  setupController: (controller, round) ->
    controller.set('model', round)