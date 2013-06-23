LMS.GameRoundController = Ember.ObjectController.extend

  needs: ['game', 'predictions', 'currentProfile']

  predictionsBinding: 'controllers.predictions'
  currentProfileBinding: 'controllers.currentProfile.model'

  selectWinner: (fixture, team) ->
    prediction = @get('predictions').find((prediction)-> prediction.get('fixture') == fixture)
    if prediction
      prediction.set('team', team)
    else
      prediction = LMS.Prediction.createRecord(fixture: fixture, team: team, profile: @get('currentProfile'))
    @get('store').commit()
