LMS.PredictionsController = Ember.ArrayController.extend
  needs: ['currentUser']
  modelBinding: 'controllers.currentUser.predictions'

  byGame: (->
    grouped = {}
    @forEach (prediction) ->
      (grouped[prediction.get('game')] ||= []).pushObject(prediction)
    grouped
  ).property('@each.game')
