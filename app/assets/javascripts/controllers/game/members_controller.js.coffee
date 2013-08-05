LMS.GameMembersController = Ember.ArrayController.extend

  needs: ['game']
  modelBinding: 'controllers.game.gameMemberships'
  itemController: 'game_membership_item'
  # Sorting based on a computed property of the itemController is not currently supported
  # See - https://github.com/emberjs/ember.js/issues/2717
  # Putting this logic in the model is not a good idea as they live in a global space
  # And could do a lot of work even when they're not visible
  sortProperties: ['lostLives']
  sortAscending: true


  # sortFunction: (a, b) ->
  #   console.log a, b
  #   0
