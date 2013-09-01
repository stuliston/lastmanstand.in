#= require ./application_route
LMS.PublicRoute = LMS.ApplicationRoute.extend

  actions:
    willTransition: ->
      @populateControllers()
