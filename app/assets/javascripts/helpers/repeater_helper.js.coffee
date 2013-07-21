Ember.Handlebars.registerHelper 'repeater', (timesPath, block) ->
    out = []
    for num in [0...@get(timesPath)]
      out.push block.fn(@)
    new Handlebars.SafeString(out.join(''))