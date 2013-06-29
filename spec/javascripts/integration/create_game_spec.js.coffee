#=require spec_helper

pavlov.specify "Creating a new game", ->

  currentProfile = null

  describe "without invitations", ->
    before ->
      LMS.League.FIXTURES = [
        {id: 1, name: "AFL"}
      ]

      LMS.Season.FIXTURES = [
        {id: 1, name: "Season", league_id: 1}
      ]
      LMS.Profile.FIXTURES = [
        {id: 1, name: "Rob"}
      ]

      Ember.run =>
        LMS.advanceReadiness()
        currentProfile = LMS.Profile.find(currentProfileId)

    it "creates a game and invites members", ->

      league = LMS.League.find(1)
      name = "New Game"
      emailsToInvite = ["fred@email.com", "fran@email.com"]

      visit("/games/new").then ->

        newGameView = find('.game-new')

        select('select[name="league"]', newGameView, league)
        fillIn('input[name="name"]', newGameView, name)

        emailsToInvite.forEach (email) ->
          fillIn('input[name="email"]', newGameView, email)
          click('.add-email', newGameView)

        click('.submit', newGameView).then ->

          game = LMS.Game.find().get('firstObject')
          assert(game.get('league')).equals(league)
          assert(game.get('name')).equals(name)

          members = game.get('gameMemberships').mapProperty('profile')
          assert(members.get('length')).equals(1)
          assert(members.objectAt(0)).equals(currentProfile)

          invitedMemberEmails = game.get('gameInvitations').mapProperty('email')
          assert(invitedMemberEmails.get('length')).equals(2)

          assert(invitedMemberEmails).isSameAs(emailsToInvite)

