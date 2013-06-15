LMS.ApplicationRoute = Ember.Route.extend

  # redirect: -> this.transitionTo('dashboard')

  model: ->
    {currentProfile: LMS.Profile.find(currentProfileId)}

  setupController: (controller, model) ->
    @controllerFor('currentProfile').set('model', model.currentProfile) #profile id hacked into bootstrap html. fix later
