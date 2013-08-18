#Track url changes and log with analytics
Ember.Application.initializer
  name: 'dataBootstrapInitializer'
  after: "store"
  initialize: (container) ->
    store = container.lookup('store:main')
    if window.userData
      store.adapterForType(LMS.User).didFindRecord(store, LMS.User, window.userData)
    else
      console.warn 'No bootstrap data was found. Initial app data will be loaded async.'
