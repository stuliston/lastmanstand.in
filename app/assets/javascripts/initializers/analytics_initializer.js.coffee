#=require ../analytics
#Track url changes and log with analytics
Ember.Application.initializer
  name: 'analyticsObserver'
  after: 'store'
  initialize: (container, application) ->
    application.inject('analytics', 'router', 'router:main')
    application.register('analytics:main', LMS.Analytics, {singleton: true})
    application.inject('controller', 'analytics', 'analytics:main')

