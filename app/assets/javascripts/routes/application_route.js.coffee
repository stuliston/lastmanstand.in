LMS.ApplicationRoute = Ember.Route.extend

  # redirect: -> this.transitionTo('dashboard')

  beforeModel: ->
    store = @get('store')
    store.adapterForType(LMS.Profile).didFindRecord(store, LMS.Profile, profileData)

  model: ->
    {currentProfile: LMS.Profile.find(currentProfileId)}

  setupController: (controller, model) ->
    @controllerFor('currentProfile').set('model', model.currentProfile) #profile id hacked into bootstrap html. fix later
