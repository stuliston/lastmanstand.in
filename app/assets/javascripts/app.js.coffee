window.LMS = Ember.Application.create
  rootElement: "#viewporter"
  # LOG_TRANSITIONS: true
  # LOG_VIEW_LOOKUPS: true
  # LOG_ACTIVE_GENERATION: true

#Ember.LOG_BINDINGS = true
#Ember.LOG_STACKTRACE_ON_DEPRECATION = true
#Ember.STRUCTURED_PROFILE = true

Ember.RSVP.configure 'onerror', (e) ->
  ga('send', 'event', 'rsvp error', e.message)
  console.log(e.message)
  console.log(e.stack)

Ember.debugObj = (message) ->
  Ember.Logger.debug("DEBUG: ", message)

