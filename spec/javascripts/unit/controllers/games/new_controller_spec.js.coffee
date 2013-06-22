#=require spec_helper

describe "player invitations and membership", ->

  game = controller = profileC = null

  beforeEach ->
    game = LMS.Game.createRecord(maxAllowedPlayers: 3)
    profileA = LMS.Profile.createRecord()
    profileB = LMS.Profile.createRecord()
    profileC = LMS.Profile.createRecord()
    game.get('gameMemberships').createRecord(game: game, profile: profileA)
    game.get('gameInvitations').createRecord(game: game, profile: profileB)

    controller = LMS.GamesNewController.create(model: game)


  it "calculates total players", ->
    expect(controller.get('totalPlayers')).toEqual(2)

  it "updates total when gameInvitation is added", ->
    game.get('gameInvitations').createRecord(game: game, profile: profileC)
    expect(controller.get('totalPlayers')).toEqual(3)

  it "updates total when gameMembership is added", ->
    game.get('gameMemberships').createRecord(game: game, profile: profileC)
    expect(controller.get('totalPlayers')).toEqual(3)

  it "calculates players remaining", ->
    expect(controller.get('totalPlayersRemaining')).toEqual(1)

  it "updates players remaining when player is invited", ->
    game.get('gameInvitations').createRecord(game: game, profile: profileC)
    expect(controller.get('totalPlayersRemaining')).toEqual(0)

  it "determines whether more players are allowed", ->
    expect(controller.get('morePlayersAllowed')).toBeTruthy()

  it "updates more players allowed when players are invited", ->
    game.get('gameInvitations').createRecord(game: game, profile: profileC)
    expect(controller.get('morePlayersAllowed')).toBeFalsy()
