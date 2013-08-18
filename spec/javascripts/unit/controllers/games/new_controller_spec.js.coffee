pavlov.specify "games/new_controller", ->
  describe "player invitations and membership", ->

    store = game = controller = userC = null

    before ->
      game = LMS.Game.createRecord(maxAllowedPlayers: 3)
      userA = LMS.Profile.createRecord()
      userB = LMS.Profile.createRecord()
      userC = LMS.Profile.createRecord()
      game.get('gameMemberships').createRecord(game: game, user: userA)
      game.get('gameInvitations').createRecord(game: game, user: userB)

      controller = controllerFor('games.new', game)


    it "calculates total players", ->
      assert(controller.get('totalPlayers')).equals(2)

    it "updates total when gameInvitation is added", ->
      game.get('gameInvitations').createRecord(game: game, user: userC)
      assert(controller.get('totalPlayers')).equals(3)

    it "updates total when gameMembership is added", ->
      game.get('gameMemberships').createRecord(game: game, user: userC)
      assert(controller.get('totalPlayers')).equals(3)

    it "calculates players remaining", ->
      assert(controller.get('totalPlayersRemaining')).equals(1)

    it "updates players remaining when player is invited", ->
      game.get('gameInvitations').createRecord(game: game, user: userC)
      assert(controller.get('totalPlayersRemaining')).equals(0)

    it "determines whether more players are allowed", ->
      assert(controller.get('morePlayersAllowed')).isTrue()

    it "updates more players allowed when players are invited", ->
      game.get('gameInvitations').createRecord(game: game, user: userC)
      assert(controller.get('morePlayersAllowed')).isFalse()
