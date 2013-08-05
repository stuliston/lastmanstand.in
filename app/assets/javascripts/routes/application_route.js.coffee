LMS.ApplicationRoute = Ember.Route.extend

  # beforeModel: ->

  model: ->
    Ember.Object.create(currentProfile: LMS.Profile.find(currentProfileId))

  setupController: (controller, model) ->
    controller.set('model', model)
    @controllerFor('currentProfile').set('model', model.get('currentProfile')) #profile id hacked into bootstrap html. fix later

