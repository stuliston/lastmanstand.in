LMS.ApplicationRoute = Ember.Route.extend

  # redirect: -> this.transitionTo('dashboard')

  setupController: (controller) ->
    @controllerFor('currentProfile').set('model', LMS.Profile.find(currentProfileId))
    # controller.set('currentProfile', ) #profile id hacked into bootstrap html. fix later
    # controller.set('leagues', LMS.League.find())