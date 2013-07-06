QUnit.testStart ->
  Ember.run ->
    # console.log 'advance'
    LMS.advanceReadiness()

QUnit.testDone ->
  Ember.run ->
    # console.log 'before reset'
    store = lookupStore()
    # store.defaultTransaction.rollback()

    for key of store.clientIdToType
      type = App.store.clientIdToType[key]
      clearCache(store, type)

    store.clientIdToData = {}
    store.clientIdToPrematerializedData = {}
    store.clientIdToId = {}
    store.clientIdToType = {}
    store.recordReferences = {}
    store.relationshipChanges = {}
    store.recordArraysByClientId = {}
    store.recordCache = []
    store.defaultTransaction.buckets =
      clean:    Ember.OrderedSet.create()
      created:  Ember.OrderedSet.create()
      updated:  Ember.OrderedSet.create()
      deleted:  Ember.OrderedSet.create()
      inflight: Ember.OrderedSet.create()

    LMS.reset()
    # console.log 'after reset'

clearCache = (store, type) ->
    map = store.typeMapFor(type)
    map.idToCid = {}
    map.clientIds = []
    map.recordArrays = []
    map.findAllCache = null
