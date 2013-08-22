#=require spec_helper

pavlov.specify "Creating a new game", ->

  currentUser = null

  describe "without invitations", ->
    before ->
      LMS.Competition.FIXTURES = [
        {id: 1, name: "AFL"}
      ]

      LMS.Season.FIXTURES = [
        {id: 1, name: "Season", competition_id: 1}
      ]
      LMS.Profile.FIXTURES = [
        {id: 1, name: "Rob"}
      ]

      Ember.run =>
        LMS.advanceReadiness()
        currentUser = LMS.Profile.find(currentUserId)

    it "creates a game and invites members", ->

      competition = LMS.Competition.find(1)
      name = "New Game"
      emailsToInvite = ["fred@email.com", "fran@email.com"]

      visit("/games/new").then ->

        newGameView = find('.game-new')

        select('select[name="competition"]', newGameView, competition)
        fillIn('input[name="name"]', newGameView, name)

        emailsToInvite.forEach (email) ->
          fillIn('input[name="email"]', newGameView, email)
          click('.add-email', newGameView)

        click('.submit', newGameView).then ->

          game = LMS.Game.find().get('firstObject')
          assert(game.get('competition')).equals(competition)
          assert(game.get('name')).equals(name)

          members = game.get('gameMemberships').mapProperty('user')
          assert(members.get('length')).equals(1)
          assert(members.objectAt(0)).equals(currentUser)

          invitedMemberEmails = game.get('gameInvitations').mapProperty('email')
          assert(invitedMemberEmails.get('length')).equals(2)

          assert(invitedMemberEmails).isSameAs(emailsToInvite)

