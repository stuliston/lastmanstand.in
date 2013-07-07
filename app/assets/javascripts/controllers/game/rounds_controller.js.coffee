LMS.GameRoundsController = Ember.ArrayController.extend

  needs: ['game']
  modelBinding: 'controllers.game.season.rounds'
  sortProperties: ['number']
  sortAscending: true
  itemController: 'round_list_item'

