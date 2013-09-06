LMS.ApplicationController = Ember.Controller.extend

  needs: ['currentUser']
  navigationVisible: false
  isPhone: false
  windowWidth: 0
  windowHeight: 0
  currentTime: new Date()
  isNewVersionAvailable: false

  init: ->
    @_super()
    @_manageWindowDimensions()
    @_trackCurrentTimeToSecond()

  isIos: (->
    'platform' of navigator && (/iphone|ipod|ipad/gi).test(navigator.platform)
  ).property()

  currentPathDidChange: (->
    @hideNavigation()
    Ember.run.next(@, @scrollTop)
  ).observes('currentPath')

  actions:
    toggleNavigation: ->
      @set('navigationVisible', !@get('navigationVisible'))
    reload: ->
      @get('analytics').trackEvent(category: 'action', action: 'app-version-reload')
      window.location.reload()

  hideNavigation: ->
    @set('navigationVisible', false)

  scrollTop: ->
    $('#main').scrollTop(0)

  destroy: ->
    clearInterval(@_timerId)

  #Not sure how often we want to trigger this? Maybe too often
  _trackCurrentTimeToSecond: ->
    @_timerId = setInterval(=>
      Ember.run => @set('currentTime', new Date())
    , 1000)

  _manageWindowDimensions: ->
    calculateWindowDimensions = =>
      width = $(window).width()
      height = $(window).height()
      @set('windowWidth', width)
      @set('windowHeight', height)
      @set('isPhone', width <= 480)

    calculateWindowDimensions()

    $(window).on 'resize', =>
      calculateWindowDimensions()