LMS.RoundFixtureController = Ember.ObjectController.extend

  needs: ['predictions']
  predictions: null

  selectedTeam: (->
    @get('currentUserPredictions').get('firstObject.team')
  ).property('currentUserPredictions.@each.team')

  isHomeTeamSelected: (->
    @get('selectedTeam') == @get('homeTeam')
  ).property('selectedTeam')

  isAwayTeamSelected: (->
    @get('selectedTeam') == @get('awayTeam')
  ).property('selectedTeam')

  homeOrAway: (->
    if @get('isHomeTeamSelected')
      'home'
    else if @get('isAwayTeamSelected')
      'away'
    else
      null
  ).property('isHomeTeamSelected', 'isAwayTeamSelected')
