LMS.CurrentRoundForGame = Ember.Mixin.create

  _currentRoundForGame: (game) ->
    now = new XDate()
    rounds = game.get('season.rounds')
    #What should the rules be for this ?? Tues - Mon?
    rounds.find((round) ->
      start = new XDate(round.get('startTime'))
      diffDays = Math.round(now.diffDays(start))
      diffDays > -3 && diffDays <= 4
    )