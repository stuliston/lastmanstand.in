window.controllerFor = (name, model) ->
  controller = Ember.controllerFor(LMS.__container__, name, model)
  controller.set('model', model) if model
  controller

window.lookupStore = ->
  LMS.__container__.lookup('store:main')
