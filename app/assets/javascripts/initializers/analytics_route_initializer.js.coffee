#Track url changes and log with analytics
Ember.Application.initializer
  name: 'analyticsRouteObserver'
  lastUrl: null
  initialize: (container) ->
    router = container.lookup('router:main')
    router.addObserver 'url', =>
      url = router.get('url')
      if window.ga && url != router.get('_lastUrl_')
        router.set('_lastUrl_', url)
        Em.run.next -> ga('send', 'pageview');