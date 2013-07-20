LMS.ApplicationRoute = Ember.Route.extend

  beforeModel: ->
    store = @get('store')
    store.adapterForType(LMS.Profile).didFindRecord(store, LMS.Profile, profileData)

  model: ->
    Ember.Object.create(currentProfile: LMS.Profile.find(currentProfileId))

  setupController: (controller, model) ->
    controller.set('model', model)  
    @controllerFor('currentProfile').set('model', model.get('currentProfile')) #profile id hacked into bootstrap html. fix later
    @controllerFor('allPredictions').set('model', LMS.Prediction.all()) 

