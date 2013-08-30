Ember.Handlebars.registerHelper 'playerLives', (options) ->

  remaining = @get(options.hash.remainingPath)
  lost = @get(options.hash.lostPath)

  total = remaining + lost

  out = "<ul class='lives unstyled horizontal #{options.hash.align}'>"

  summaryItem = "<li class='summary'>"

  switch remaining
    when 0 then summaryItem += "No lives"
    when 1 then summaryItem += "1 life"
    else summaryItem += "#{remaining} lives"

  if options.hash.showLongDescription
    summaryItem += " remaining"

  summaryItem += "</li>"

  if options.hash.align == 'right'
    out += summaryItem

  for num in [0...total]

    out += '<li>'
    if num >= remaining
      out += '<i class="spritemaps-life-used"></i>'
    else
      out += '<i class="spritemaps-life-remaining"></i>'

    out += '</li>'

  if options.hash.align == 'left'
    out += summaryItem

  out += '</ul>'

  new Handlebars.SafeString(out)