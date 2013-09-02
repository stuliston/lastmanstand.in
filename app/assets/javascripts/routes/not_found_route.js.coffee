#= require ./public_route
LMS.NotFoundRoute = LMS.PublicRoute.extend

  setupController: ->
    @controllerFor('application').set('pageTitle', "LAST MAN STANDING")

  actions:
    willTransition: ->
      @controllerFor('notFound').set('model', null)