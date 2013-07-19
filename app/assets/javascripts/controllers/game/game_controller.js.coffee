LMS.GameController = Ember.ObjectController.extend

  modelDidChange: (->
    game = @get('model')
    if game
      localStorage.setItem 'lastGameId', game.get('id')
  ).observes('model')  

  lastGame: ->
    if id = localStorage.getItem 'lastGameId'    
      LMS.Game.find(id)
      

