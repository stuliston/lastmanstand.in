LMS.GamePredictionsController = Ember.ArrayController.extend

  byFixture: (->
    grouped = {}
    @forEach (prediction) ->
      (grouped[prediction.get('fixture')] ||= []).pushObject(prediction)
    grouped
  ).property('@each.fixture')
