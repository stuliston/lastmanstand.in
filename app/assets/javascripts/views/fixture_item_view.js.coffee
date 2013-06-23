LMS.FixtureItemView = Ember.View.extend

  fixture: null
  predictions: null

  selectedTeam: (->
    fixture = @get('fixture')
    @get('predictions')?.findProperty('fixture', fixture)?.get('team')
  ).property('predictions.@each.team')

  isHomeTeamSelected: (->
    console.log @get('selectedTeam') == @get('fixture.homeTeam')
    @get('selectedTeam') == @get('fixture.homeTeam')
  ).property('selectedTeam')

  isAwayTeamSelected: (->
    @get('selectedTeam') == @get('fixture.awayTeam')
  ).property('selectedTeam')
