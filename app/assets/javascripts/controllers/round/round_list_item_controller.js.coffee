LMS.RoundListItemController = Ember.ObjectController.extend

  needs: ['predictions', 'game']


  prediction: (->
    round = @get('model')
    game = @get('controllers.game.model')
    @get('controllers.predictions').find((prediction) =>
      prediction.get('fixture.round') == round && prediction.get('game') == game
    )
  ).property('predictions.@each.fixture', 'predictions.@each.team')

  selectedTeam: (->
    @get('prediction.team')
  ).property('prediction')

  nonSelectedTeam: (->
    selected = @get('prediction.team')
    [@get('prediction.fixture.homeTeam'),@get('prediction.fixture.awayTeam')].without(selected)[0]
  ).property('prediction')

  isSelectionCorrect: (->
    @get('prediction.team') == @get('prediction.fixture.winningTeam')
  ).property('prediction')

  selectionClass: (->
    if @get('prediction.team')
      if @get('isSelectionCorrect')
        "correct"
      else
        "incorrect"
    else
      ""
  ).property('prediction')