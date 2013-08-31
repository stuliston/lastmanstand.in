LMS.Adapter = DS.RESTAdapter.extend()

# LMS.Adapter.configure("plurals", {
#   # availability: "availabilities"
# })

LMS.Adapter.configure('LMS.User', {
 sideloadAs: 'users'
})

# LMS.Adapter.configure('LMS.Game', {
#   sideloadAs: 'games'
# })

# LMS.Adapter.configure('LMS.GameMembership', {
#  sideloadAs: 'game_memberships'
# })

LMS.Store = DS.Store.extend
  revision: 12
  adapter: LMS.Adapter.create
    namespace: 'api'
