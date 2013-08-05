#Track url changes and log with analytics
Ember.Application.initializer
  name: 'dataBootstrapInitializer'
  after: "store"
  initialize: (container) ->
    store = container.lookup('store:main')
    if window.profileData
      store.adapterForType(LMS.Profile).didFindRecord(store, LMS.Profile, window.profileData)
    else
      console.warn 'No bootstrap data was found. Initial app data will be loaded asynch.'
