#Load the current logged in user
Ember.Application.initializer
  name: 'currentUserInitializer'
  after: "store"
  initialize: (container) ->
    store = container.lookup('store:main')
    if window.userData
      store.adapterForType(LMS.User).didFindRecord(store, LMS.User, window.userData)
      currentUser = LMS.User.find(window.userData?.user.id)
      container.lookup('controller:currentUser').set('model', currentUser)
