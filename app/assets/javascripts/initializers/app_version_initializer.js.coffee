Ember.Application.initializer
  name: 'appVersionInitializer'
  initialize: (container) ->

    runningVersion = $('meta[name="app-version"]').attr('content')

    $(document).ajaxSuccess((event, xhr, settings) ->
      currentVersion = xhr.getResponseHeader('X-GitSHA')
      if currentVersion != runningVersion
        container.lookup('controller:application').set('isNewVersionAvailable', true)
    )
