#= require jquery
#= require handlebars
#= require ember
#= require ember-data
#= require viewporter
#= require fastclick
#= require_self
#= require lastmanstanding

window.LMS = Ember.Application.create()

$(document).ready ->
  new FastClick(document.body)

#= require_tree .
