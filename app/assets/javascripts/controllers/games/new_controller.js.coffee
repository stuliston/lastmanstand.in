LMS.GamesNewController = Ember.ObjectController.extend

  saveGame: ->
    @get('store').commit()
    # @transitionToRoute(@get('indexRoute'))