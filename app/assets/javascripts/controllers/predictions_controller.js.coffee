LMS.PredictionsController = Ember.ArrayController.extend
  needs: ['currentProfile']
  modelBinding: 'controllers.currentProfile.predictions'

  byGame: (->
    grouped = {}
    @forEach (prediction) ->
      (grouped[prediction.get('game')] ||= []).pushObject(prediction)
    grouped  
  ).property('@each.game')
