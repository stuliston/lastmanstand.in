LMS.RoundFixtureController = Ember.ObjectController.extend

  needs: ['predictions', 'game']

  selectedTeam: (->
    @get('controllers.predictions').find((prediction) =>
      prediction.get('game') == @get('controllers.game.model') && prediction.get('fixture') == @get('model')
    )?.get('team')
  ).property('controllers.predictions.@each.team')

  isHomeTeamSelected: (->
    @get('selectedTeam') == @get('homeTeam')
  ).property('selectedTeam')

  isAwayTeamSelected: (->
    @get('selectedTeam') == @get('awayTeam')
  ).property('selectedTeam')

  disableHomeTeam: (->
    @get('controllers.predictions').some((prediction) =>
      prediction.get('team') == @get('homeTeam') && prediction.get('game') == @get('controllers.game.model')
    )
  ).property('controllers.predictions.@each.team')

  disableAwayTeam: (->
    @get('controllers.predictions').some((prediction) =>
      prediction.get('team') == @get('awayTeam') && prediction.get('game') == @get('controllers.game.model')
    )
  ).property('controllers.predictions.@each.team')


  homeOrAway: (->
    if @get('isHomeTeamSelected')
      'home'
    else if @get('isAwayTeamSelected')
      'away'
    else
      null
  ).property('isHomeTeamSelected', 'isAwayTeamSelected')
