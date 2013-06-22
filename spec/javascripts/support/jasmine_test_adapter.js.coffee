LMS.JasmineTestAdapter = Ember.Test.Adapter.extend
  asyncStart:->
    @async = true
    waitsFor(-> !@async)
  asyncEnd: ->
    @async = false
  exception: (error) ->
    fail(error)
