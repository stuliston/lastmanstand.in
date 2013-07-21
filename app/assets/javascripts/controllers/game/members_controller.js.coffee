LMS.GameMembersController = Ember.ArrayController.extend

  needs: ['game']
  modelBinding: 'controllers.game.gameMemberships'
  itemController: 'game_membership_item'
  # sortProperties: ['lostLives']
  # sortAscending: true
  sortFunction: ->
    console.log 'aa'
