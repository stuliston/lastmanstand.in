LMS.FixtureItemView = Ember.View.extend

  fixture: null
  predictions: null
  classNameBindings: ['homeOrAway']
  tagName: 'li'

  selectedTeam: (->
    @get('fixture.currentUserPredictions').get('firstObject.team')
  ).property('fixture.currentUserPredictions.@each.team')

  isHomeTeamSelected: (->
    @get('selectedTeam') == @get('fixture.homeTeam')
  ).property('selectedTeam')

  isAwayTeamSelected: (->
    @get('selectedTeam') == @get('fixture.awayTeam')
  ).property('selectedTeam')

  homeOrAway: (->
    if @get('isHomeTeamSelected')
      'home'
    else if @get('isAwayTeamSelected')
      'away'
    else
      null
  ).property('isHomeTeamSelected', 'isAwayTeamSelected')
