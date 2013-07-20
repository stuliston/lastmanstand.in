LMS.GamePredictionsController = Ember.ArrayController.extend

  needs: ['game']
  modelBinding: 'controllers.game.predictions'

  byFixture: (->
    grouped = {}
    @forEach (prediction) ->
      (grouped[prediction.get('fixture')] ||= []).pushObject(prediction)
    grouped  
  ).property('@each.fixture')
