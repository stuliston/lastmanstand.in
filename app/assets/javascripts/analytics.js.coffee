#Injected into every controller as 'analytics'
LMS.Analytics = Ember.Object.extend

  router: null #injected
  lastUrl: null

  init: ->
    router = @get('router')
    router.addObserver 'url', =>
      url = router.get('url')
      if window.ga && url != router.get('_lastUrl_')
        router.set('_lastUrl_', url)
        Em.run.once ->
          ga('send', 'pageview')

  trackEvent: (options) ->
    if options.category && options.action
      ga('send', 'event', options.category, options.action, options.label, options.value)