LMS.ApplicationController = Ember.Controller.extend

  navigationVisible: false
  isPhone: false
  windowWidth: 0

  init: ->

    calculateWindowWidth = =>
      width = $(window).width()
      @set('windowWidth', width)
      @set('isPhone', width <= 480)

    calculateWindowWidth()

    $(window).on 'resize', =>
      calculateWindowWidth()


  toggleNavigation: ->
    @set('navigationVisible', !@get('navigationVisible'))

  currentPathDidChange: (->
    @set('navigationVisible', false)
  ).observes('currentPath')
