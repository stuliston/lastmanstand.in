Ember.Handlebars.registerHelper 'playerLives', (remainingPath, lostPath) ->

  remaining = @get(remainingPath)
  lost = @get(lostPath)
  total = remaining + lost

  out = "<ul class='lives unstyled horizontal'><li class='summary'>"

  switch remaining
    when 0 then out += "No lives"
    when 1 then out += "1 life"
    else out += "#{remaining} lives"

  out += "</li>"

  for num in [0...total]

    out += '<li>'
    if num >= remaining
      out += '<i class="spritemaps-life-used"></i>'
    else
      out += '<i class="spritemaps-life-remaining"></i>'

    out += '</li>'

  out += '</ul>'

  new Handlebars.SafeString(out)