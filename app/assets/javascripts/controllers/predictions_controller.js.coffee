LMS.PredictionsController = Ember.ArrayController.extend

  byGame: (->
    grouped = {}
    @forEach (prediction) ->
      (grouped[prediction.get('game')] ||= []).pushObject(prediction)
    grouped
  ).property('@each.game')
