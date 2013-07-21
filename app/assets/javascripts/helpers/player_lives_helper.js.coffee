Ember.Handlebars.registerHelper 'playerLives', (remainingPath, lostPath) ->

  remaining = @get(remainingPath)
  lost = @get(lostPath)
  total = remaining + lost

  out = '<ul class="lives unstyled horizontal">'

  for num in [0...total]

    out += '<li>'
    if num >= remaining
      out += '<i class="icon-heart-empty"></i>'
    else
      out += '<i class="icon-heart"></i>'

    out += '</li>'

  out += '</ul'

  new Handlebars.SafeString(out)