LMS.RoundListItemController = Ember.ObjectController.extend

  needs: ['predictions', 'game']
  game: Ember.computed.alias('controllers.game.model')
  predictions: Ember.computed.alias('controllers.predictions')

  prediction: (->
    round = @get('model')
    game = @get('game')
    @get('predictions').find((prediction) =>
      prediction.get('fixture.round') == round && prediction.get('game') == game
    )
  ).property('predictions.@each.team')

  winningTeam: (->
    @get('prediction.fixture.winningTeam')
  ).property('prediction.fixture.winningTeam')

  hasResult: (->
    @get('prediction.fixture.hasResult')
  ).property('winningTeam')

  losingTeam: (->
    @get('prediction.fixture.losingTeam')
  ).property('prediction.fixture.losingTeam')

  selectedTeam: (->
    @get('prediction.team')
  ).property('prediction.team')

  nonSelectedTeam: (->
    selected = @get('prediction.team')
    if selected
      [@get('prediction.fixture.homeTeam'),@get('prediction.fixture.awayTeam')].without(selected)[0]
  ).property('prediction.team')

  isSelectionCorrect: (->
    @get('prediction.team') == @get('winningTeam')
  ).property('prediction.team')

  isBeforeGameStarted: (->
    @get('game.createdAt') > @get('startTime')
  ).property('game.createdAt', 'startTime')

  isCurrentRound: (->
    @get('controllers.game.currentRound') == @get('model')
  ).property('controllers.game.currentRound', 'model')

  selectionClass: (->
    if @get('prediction.team')
      if @get('isSelectionCorrect')
        "correct"
      else if @get('hasResult')
        "incorrect"
  ).property('prediction')