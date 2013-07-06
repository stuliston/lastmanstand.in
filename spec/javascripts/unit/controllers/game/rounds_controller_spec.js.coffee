pavlov.specify "game/rounds_controller", ->

  describe "sorting", ->

    controller = rounds = null

    before ->
      season = LMS.Season.createRecord()
      game = LMS.Game.createRecord(season: season)
      round1 = LMS.Round.createRecord(number: 1, season: season)
      round2 = LMS.Round.createRecord(number: 2, season: season)
      round3 = LMS.Round.createRecord(number: 3, season: season)
      gameController = controllerFor('game', game)
      controller = controllerFor('game.rounds')

    it "sorts by round number ascending", ->
      assert(controller.objectAt(0).get('number')).equals 1
      assert(controller.objectAt(1).get('number')).equals 2
      assert(controller.objectAt(2).get('number')).equals 3

