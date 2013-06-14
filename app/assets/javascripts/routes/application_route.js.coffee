LMS.ApplicationRoute = Ember.Route.extend
  redirect: -> this.transitionTo('dashboard')
