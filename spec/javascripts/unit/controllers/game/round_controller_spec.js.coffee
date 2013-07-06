pavlov.specify "game/round_controller", ->

  describe "computed properties", ->

    gameRoundController = gameController = round = previousRound = nextRound = season = null

    before ->
      Ember.run ->
        previousRound = LMS.Round.createRecord(number: 1)
        nextRound = LMS.Round.createRecord(number: 3)
        gameController = controllerFor('game', LMS.Game.createRecord())
        round = LMS.Round.createRecord(startTime: new Date(), number: 2)
        gameRoundController = controllerFor('game.round', round)
        gameRoundsController = controllerFor('game.rounds', [round, nextRound, previousRound])

    describe "isRoundClosed", ->
      it "is based on current time", ->

        applicationController = gameRoundController.get('controllers.application')
        roundStartTime = gameRoundController.get('startTime')
        futureTime = new Date(roundStartTime.getTime() + 1000)
        Ember.run -> applicationController.set('currentTime', futureTime)
        assert(gameRoundController.get('isRoundClosed')).isTrue()

        pastTime = new Date(roundStartTime.getTime() - 1000)
        Ember.run -> applicationController.set('currentTime', pastTime)
        assert(gameRoundController.get('isRoundClosed')).isFalse()

    describe "next and previous rounds", ->
      it "calculates previous round", ->
        assert(gameRoundController.get('previousRound')).equals previousRound

      it "calculates next round", ->
        assert(gameRoundController.get('nextRound')).equals nextRound


  describe "actions", ->

    gameRoundController = gameController = round = previousRound = season = null
    game = team1 = team2 = fixture1 = fixture2 = store = null

    before ->
      Ember.run ->
        now = new Date()
        timeInPast = new Date(new Date().getTime() - 1000)
        store = lookupStore()
        season = LMS.Season.createRecord()
        round1 = LMS.Round.createRecord(startTime: now, number: 1, season: season)
        round2 = LMS.Round.createRecord(startTime: now, number: 2, season: season)
        team1 = LMS.Team.createRecord()
        team2 = LMS.Team.createRecord()
        fixture1 = LMS.Fixture.createRecord(homeTeam: team1, awayTeam: team2, round: round1)
        fixture2 = LMS.Fixture.createRecord(homeTeam: team1, awayTeam: team2, round: round2)
        game = LMS.Game.createRecord(season: season)
        prediction = LMS.Prediction.createRecord(game: game, fixture: fixture1, team: team1)

        controllerFor('currentProfile').get('predictions').pushObject(prediction)
        controllerFor('application').set('currentTime', timeInPast)

        gameController = controllerFor('game', game)
        gameRoundController = controllerFor('game.round', round2)
        gameRoundsController = controllerFor('game.rounds', [round1, round2])
        predictionsController = controllerFor('predictions')


    after ->
      store.commitDefaultTransaction.restore()

    describe "selecting winner", ->

      expectation = null

      before ->
        expectation = sinon.mock(store).expects('commitDefaultTransaction')

      after ->
        expectation.verify()
        assert(true).isTrue()

      it "can select if not previously selected within game", ->
        gameRoundController.selectWinner(fixture2, team2)


    describe "selecting winner", ->

      expectation = null

      before ->
        expectation = sinon.mock(store).expects('commitDefaultTransaction')

      after ->
        expectation.verify()
        assert(true).isTrue()

      it "can select if not previously selected within game", ->
        expectation.once()
        gameRoundController.selectWinner(fixture2, team2)

      it "can select if the round is not closed", ->
        expectation.once()
        gameRoundController.selectWinner(fixture2, team2)

      it "cannot select if the round is closed", ->
        expectation.never()
        Ember.run ->
          controllerFor('application').set('currentTime', new Date(new Date().getTime() + 1000))
        gameRoundController.selectWinner(fixture2, team2)

      it "cannot select if the team has been selected in a previous round", ->
        expectation.never()
        gameRoundController.selectWinner(fixture2, team1)

