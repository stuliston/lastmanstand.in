LMS.RoundFixturesController = Ember.ArrayController.extend

  itemController: 'round_fixture'

  byDate: (->
    grouped = {}
    @forEach (fixture) ->
      startTime = fixture.get('startTime')
      date = new XDate(startTime.getFullYear(), startTime.getMonth(), startTime.getDate())
      (grouped[date] ||= []).pushObject(fixture)

    result = []
    for date, fixtures of grouped
      result.push({date: new Date(date), fixtures: fixtures})

    result.sort (groupA, groupB) ->
      groupA.date - groupB.date

    result.forEach (group) ->
      group.fixtures.sort (fixtureA, fixtureB) ->
        fixtureA.get('startTime') - fixtureB.get('startTime')

    result

  ).property('@each.startTime')

