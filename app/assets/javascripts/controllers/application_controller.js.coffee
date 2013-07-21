LMS.ApplicationController = Ember.Controller.extend

  navigationVisible: false
  isPhone: false
  windowWidth: 0
  currentTime: new Date()

  init: ->
    @_super()
    @_manageWindowWidth()
    @_trackCurrentTimeToSecond()

  toggleNavigation: ->
    @set('navigationVisible', !@get('navigationVisible'))

  currentPathDidChange: (->
    @set('navigationVisible', false)
  ).observes('currentPath')

  hideNavigation: ->
    @set('navigationVisible', false)

  #Not sure how often we want to trigger this? Maybe too often
  _trackCurrentTimeToSecond: ->
    @_timerId = setInterval(=>
      Ember.run => @set('currentTime', new Date())
    , 1000)

  destroy: ->
    clearInterval(@_timerId)

  _manageWindowWidth: ->
    calculateWindowWidth = =>
      width = $(window).width()
      @set('windowWidth', width)
      @set('isPhone', width <= 480)

    calculateWindowWidth()

    $(window).on 'resize', =>
      calculateWindowWidth()