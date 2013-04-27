LMS.Adapter = DS.FixtureAdapter.extend()

LMS.Store = DS.Store.extend
  revision: 12
  adapter: LMS.Adapter.create()
