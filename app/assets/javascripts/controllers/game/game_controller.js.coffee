LMS.GameController = Ember.ObjectController.extend

  modelDidChange: (->
    game = @get('model')
    if game
      localStorage.setItem 'lastGameId', game.get('id')
  ).observes('model')  

  lastGame: ->
    if id = localStorage.getItem 'lastGameId' 
      #don't us a find by id. Only look for previously loaded games in case the game no longer exists   
      LMS.Game.all().findProperty(id) 
      

