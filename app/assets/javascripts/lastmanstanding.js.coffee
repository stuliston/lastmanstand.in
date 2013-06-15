#= require ./app
#= require ./store
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./templates
#= require_tree ./validation
#= require ./router
#= require_tree ./routes
#= require_self

$(document).ready ->
  new FastClick(document.body)

$(->
  $.ajaxSetup({
    headers: {
      "X-CSRF-Token": $('meta[name="csrf-token"]').attr("content")
    }
  })
)

