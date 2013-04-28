LMS.Adapter = DS.RESTAdapter.extend()

LMS.Adapter.configure("plurals", {
  # availability: "availabilities"
})

LMS.Adapter.configure('LMS.Profile', {
  sideloadAs: 'profiles'
})
LMS.Adapter.configure('LMS.Game', {
  sideloadAs: 'games'
})

LMS.Adapter.configure('LMS.GameParticipants', {
  sideloadAs: 'game_participants'
})

LMS.Store = DS.Store.extend
  revision: 12
  adapter: LMS.Adapter.create
    namespace: 'api'
