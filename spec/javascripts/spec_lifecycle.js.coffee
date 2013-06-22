# QUnit.testStart ->


afterEach ->
  Ember.run ->
    console.log 'reset'
    LMS.reset()