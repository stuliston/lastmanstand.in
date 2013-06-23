LMS.PredictionsController = Ember.ArrayController.extend
  needs: ['currentProfile']
  modelBinding: 'controllers.currentProfile.predictions'
